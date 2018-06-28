# Description:
#   Create a release pull request on GitHub via hubot.
#
# Configuration:
#   HUBOT_RELEASE_GITHUB_TOKEN # required
#   HUBOT_RELEASE_HEAD # defaults to "master"
#   HUBOT_RELEASE_BASE # defaults to "release"
#   HUBOT_RELEASE_DEFAULT_OWNER
#   HUBOT_RELEASE_TEMPLATE_PATH
#   HUBOT_RELEASE_GITHUB_ENDPOINT # defaults to "https://api.github.com"
#   HUBOT_RELEASE_MESSAGE_PROCESSING # defaults to "Now processing..."   
#
# Commands:
#   hubot release <owner>/<repository> - Create or update a release pull request
#
# Author:
#   ttskch

release = require 'github-pr-release'
_ = require 'underscore'

config =
  token: process.env.HUBOT_RELEASE_GITHUB_TOKEN
  head: process.env.HUBOT_RELEASE_HEAD or 'master'
  base: process.env.HUBOT_RELEASE_BASE or 'release'
  template: process.env.HUBOT_RELEASE_TEMPLATE_PATH
  endpoint: process.env.HUBOT_RELEASE_GITHUB_ENDPOINT or 'https://api.github.com'
  messages:
    processing: process.env.HUBOT_RELEASE_MESSAGE_PROCESSING or 'Now processing...'

doRelease = (owner, repo, msg) ->
  msg.send config.messages.processing
  release(_.extend({owner: owner, repo: repo}, config))
    .then (pr) ->
      msg.send "Created release PR for #{owner}/#{repo}: #{pr.html_url}"
    .catch (err) ->
      msg.send "Error: #{err.message}"

module.exports = (robot) ->
  robot.respond /release +([^ \/]+)\/([^ \/]+) *$/i, (msg) ->
    owner = msg.match[1]
    repo = msg.match[2]
    doRelease owner, repo, msg

  robot.respond /release +([^ \/]+) *$/i, (msg) ->
    owner = process.env.HUBOT_RELEASE_DEFAULT_OWNER
    repo = msg.match[1]
    doRelease owner, repo, msg if owner
