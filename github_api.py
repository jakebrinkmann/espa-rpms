#!/usr/bin/env python
import urllib3, os, shutil, time, tempfile, getpass, base64
urllib3.disable_warnings(urllib3.exceptions.InsecureRequestWarning)

import requests
import git
BASE_URL = 'https://api.github.com/'

def github(endpoint, data=None, verb='get', creds=''):
    url = BASE_URL + endpoint + '?per_page=100'
    headers = {"Authorization": "Basic %s" % base64.b64encode(creds)}
    res = getattr(requests, verb)(url, data=data, verify=False, headers=headers)
    res.raise_for_status()
    return res.json()

def plnk(string):
    return string.split('{')[0].replace(BASE_URL, '')

def get_repo_tags(full_name, git_url):
    BASE_DIR = tempfile.mkdtemp()
    DIR_NAME = BASE_DIR + full_name
    REMOTE_URL = git_url
    os.makedirs(DIR_NAME + '/.git')
    repo = git.Repo.init(DIR_NAME)
    origin = repo.create_remote('origin', REMOTE_URL)
    origin.fetch()
    tags = sorted(repo.tags, key=lambda t: t.commit.committed_datetime)
    try:
        os.unlink(BASE_DIR)
    except:
        pass
    return tags

creds = '{}:{}'.format(raw_input("Username: "), getpass.getpass())
repos_list = github('orgs/USGS-EROS/repos', creds=creds)

for repo in repos_list:
    name = repo['name']
    if not name.startswith('espa-'):
        continue

    pulls_url = plnk(repo['pulls_url'])
    pulls_list = github(pulls_url, creds=creds)

    releases_url = plnk(repo['releases_url'])
    releases_list = github(releases_url, creds=creds)

    tags_url = plnk(repo['tags_url'])
    tags_list = github(tags_url, creds=creds)

    if len(pulls_list) > 0:
        print('>>> {}: has {} open pulls'.format(name, len(pulls_list)))
        pull = pulls_list[0]
        print('*** Pull #{} "{}" [{}] from {} <--- {}'.format(pull['number'], pull['title'], pull['created_at'], pull['user']['login'], pull['head']['ref']))

    tags = map(str, get_repo_tags(repo['full_name'], repo['git_url']))
    if tags:
        print('{}: Latest Tag: {}'.format(name, tags[-1]))
