require 'spec_helper'

describe Employment do

  before do
    # stub_request(:get, "https://api.github.com/orgs/github/members").to_return(:status => 200, :body => {}, :headers => {})
  end

  subject { Employment.new('holman') }

  describe '.employed_at?' do
    it 'returns true when a user works for the company' do
      FakeGithub.stub_org_members('github')
      subject.should be_employed_at('github')
    end

    xit 'returns false when a user does not work for the company' do
      #FakeGithub.stub_org_members('groupon')
      subject.should_not be_employed_at('groupon')
    end
  end
end
