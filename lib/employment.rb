require 'github_api'

class Employment

  def initialize(user)
    @user = user
  end

  def employed_at?(company)
    members = Github.new.orgs.members.list company
    members.each do |member|
      if @user.casecmp(member['login']) == 0
        return true
      end
    end
    false
  end
end
