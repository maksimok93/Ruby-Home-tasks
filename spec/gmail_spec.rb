require 'rspec'
require_relative '../api_task/app_methods'
require_relative '../api_task/constants'
require_relative '../api_task/quickstart'

RSpec.describe 'Inbox functionality:' do
  context 'When user sends an e-mail,' do
    it 'Verify that e-mail is in the inbox' do
      send_email(UsersData::EMAIL, body: TestsData::MAIL_BODY)
      expect(get_email_by_date(UsersData::SENDER, '2020/11/25')).to eq(TestsData::MAIL_BODY)
    end

    it 'Verify that e-mail has been deleted' do
      send_email(UsersData::EMAIL, body: TestsData::MAIL_BODY)
      new_id = get_email_ids(UsersData::EMAIL)
      delete_email(new_id)
      expect(get_email_ids(UsersData::EMAIL)).not_to be == new_id
    end
  end
end
