# hubot-github-pr-release

[![npm version](https://img.shields.io/npm/v/hubot-github-pr-release.svg)](https://www.npmjs.com/package/hubot-github-pr-release)
[![npm downloads](https://img.shields.io/npm/dm/hubot-github-pr-release.svg)](https://www.npmjs.com/package/hubot-github-pr-release)

Create a release pull request on GitHub by using [github-pr-release](https://github.com/uiureo/github-pr-release) via hubot.

## Installation

Install via npm.

```bash
$ cd /path/to/hubot
$ npm install --save hubot-github-pr-release
```

And add to `external-scripts.json`.

```bash
$ cat external-scripts.json
["hubot-github-pr-release"]
```

## Configuration

```bash
# required
$ export HUBOT_RELEASE_GITHUB_TOKEN="github_token_here"

# optional
$ export HUBOT_RELEASE_HEAD="staging" # defaults to "master"
$ export HUBOT_RELEASE_BASE="master" # defaults to "release"
$ export HUBOT_RELEASE_DEFAULT_OWNER="ttskch"
$ export HUBOT_RELEASE_TEMPLATE_PATH="/path/to/template.mustache" # absolute path only
```

### Modify template

You can use your own template of the release pull request.
For example, following template uses the **author's** username instead of the **assignee's** one of each pull requests in the message of the release pull request.

```
Release {{version}}
{{#prs}}
- [ ] #{{number}} {{title}} {{#user}}@{{login}}{{/user}}
{{/prs}}
```

See [here](https://github.com/uiureo/github-pr-release#specify-a-message-format) to learn more.

## Usage

```bash
# Create or update a release pull request
hubot> hubot release ttskch/hubot-github-pr-release

# If HUBOT_RELEASE_DEFAULT_OWNER is set you can omit owner
hubot> hubot release hubot-github-pr-release
```
