require 'webmock'

class FakeGithub
  def self.stub_org_members(org)
    WebMock.stub_request(:get, "https://api.github.com/orgs/#{org}/members").
              to_return(:status => 200, :body => {}, :headers => {})
  end
end
