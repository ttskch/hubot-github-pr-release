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
$ export HUBOT_RELEASE_DEFAULT_OWNER="qckanemoto"
```

## Usage

```bash
# Create or update a release pull request
hubot> hubot release qckanemoto/hubot-github-pr-release

# If HUBOT_RELEASE_DEFAULT_OWNER is set you can omit owner
hubot> hubot release hubot-github-pr-release
```
