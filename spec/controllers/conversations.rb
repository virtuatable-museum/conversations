RSpec.describe Controllers::Conversations do
  def app
    Controllers::Conversations
  end

  let!(:account) { create(:account) }
  let!(:session) { create(:session, account: account) }
  let!(:application) { create(:application, creator: account) }
end