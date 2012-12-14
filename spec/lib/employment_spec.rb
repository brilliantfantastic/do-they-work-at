require 'spec_helper'

describe Employment do
  describe '.employed_at?' do
    context 'provide a Github username' do
      before { FakeGithub.stub_org_members('github', ['holman']) }
      subject { Employment.new('holman') }
      it 'returns true when the user works for the company' do
        subject.should be_employed_at('github')
      end

      it 'returns false when a user does not work for the company' do
        Employment.new('jwright').should_not be_employed_at('github')
      end
    end

    context 'provide a camelcased Github username' do
      subject { Employment.new('Holman') }
      it 'returns true when the user works for the company and the username is uppercased' do
        FakeGithub.stub_org_members('github', ['holman'])
        subject.should be_employed_at('github')
      end
    end
  end
end
