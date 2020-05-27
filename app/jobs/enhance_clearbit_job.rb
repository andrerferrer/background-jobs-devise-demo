require 'clearbit'

class EnhanceClearbitJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    # access clearbit
    Clearbit.key = ENV['CLEARBIT_API_KEY']
    response = Clearbit::Enrichment.find(email: user.email)
    # update user with clearbit data
    if response&.person
      user.full_name = response.person.name.fullName
      user.location = response.person.location
      user.avatar_url = response.person.github.avatar
      user.github_handle = response.person.github.handle

      user.save
    end
  end
end
