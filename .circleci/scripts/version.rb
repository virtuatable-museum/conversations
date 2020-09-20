#!/usr/bin/env ruby
require 'octokit'
require 'semantic'
require 'git'

def docker_url
  "https://registry.hub.docker.com/v2/repositories/virtuatable/conversations/tags"
end

def client
  Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
end

def local_git
  ::Git.open('~/conversations', log: Logger.new(STDOUT))
end

def last_commit
  local_git.log(1).first.sha
end

def current_version
  body = JSON.parse(Faraday.get(docker_url).body)
  Semantic::Version.new(body['results'][0]['name'])
rescue
  Semantic::Version.new('0.0.0')
end

def next_version
  current_version.increment!(increment)
end

def increment
  ['major', 'minor'].each do |label|
    return label if labels.include? label
  end
  'patch'
end

def pull_request
  repository = 'virtuatable/conversations'
  requests = client.pull_requests(repository, {state: 'all'})
  requests.find { |r| r[:merge_commit_sha] == last_commit }
end

def labels
  return [] if pull_request.nil?
  return pull_request[:labels].map { |l| l[:name] }
end

if ARGV.first == 'next'
  puts next_version.to_s
else
  puts current_version.to_s
end