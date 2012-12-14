require 'webmock'
require 'json'

class FakeGithub
  def self.stub_org_members(org, members=nil)
    body = []
    unless members.nil?
      members.each do |member|
        body << { type: 'User', url: "http://api.github.com/users/#{member}", login: member }
      end
    end
    WebMock.stub_request(:get, "https://api.github.com/orgs/#{org}/members").
              to_return(:status => 200, :body => body.to_json, :headers => {})
  end
end
