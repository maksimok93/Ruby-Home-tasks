require 'rspec'
require_relative '../api_task/app_methods'
require_relative '../api_task/constants'
require_relative '../api_task/quickstart'

RSpec.describe 'Inbox functionality:' do
  context 'When user sends an e-mail,' do
    it 'Verify that message is in the inbox' do
      send_message(UsersData::EMAIL, body: 'test message')
      expect(get_last_message(UsersData::EMAIL)).to eq('test message')
    end

    it 'Verify that message has been deleted' do
      send_message(UsersData::EMAIL, body: 'test message')
      new_id = get_last_message_id(UsersData::EMAIL)
      delete_message(new_id)
      expect(get_last_message_id(UsersData::EMAIL)).not_to be == new_id
    end
  end
end

# RSpec.describe 'Draft functionality:' do
#   context 'When user creates a draft' do
#     it 'Verify that draft has been created' do
#
#     end
#   end
# end
