#!/usr/bin/env ruby
require 'octokit'
require 'semantic'

def docker_url
  "https://registry.hub.docker.com/v2/repositories/virtuatable/conversations/tags"
end

def client
  Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
end

def next_version
  body = JSON.parse(Faraday.get(docker_url).body)
  current = Semantic::Version.new(body['results'][0]['name'])
  current.increment!(increment).to_s
rescue
  Semantic::Version.new('0.0.0').to_s
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

puts next_version