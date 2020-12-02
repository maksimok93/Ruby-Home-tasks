require_relative 'quickstart'
require_relative 'constants'
require 'mime'
include MIME

def send_email(recipient, subject: nil, body: nil)
  mail = Mail.new
  mail.from    = UsersData::SENDER
  mail.to      = recipient.to_s
  mail.subject = subject.to_s
  mail.body    = body.to_s

  message = Google::Apis::GmailV1::Message.new(raw: mail.to_s)
  $service.send_user_message($user_id, message)
end

def get_email_ids(from = nil, text = nil)
  emails = $service.list_user_messages(
      $user_id,
      max_results: 10,
      q: "from: #{from.to_s} #{text.to_s}"
  )

  mail = emails.messages.map { |mail| "#{mail.id}" }
  mail.join(', ')
end

def delete_email(id)
  $service.delete_user_message($user_id, id)
end

def get_email_by_date(from = nil, date = nil)
  emails = $service.list_user_messages(
      $user_id,
      max_results: 1,
      q: "from: #{from.to_s} after:#{date}"
  )

  email_array = []
  emails.messages.each do |mail|
    email = $service.get_user_message($user_id, mail.id)
    my_email = {
        date: email.payload.headers.find { |header| header.name == 'Date' }.value,
        body: email.payload.body.data
    }
    email_array.push(my_email)
  end

  email_array[0][:body]
end

def create_new_draft(recipient = nil, subject = nil, body = nil)
  mail = Mail.new
  mail.from    = UsersData::EMAIL
  mail.to      = recipient.to_s
  mail.subject = subject.to_s
  mail.body    = body.to_s

  message = Google::Apis::GmailV1::Message.new(raw: mail.to_s)

  draft = Google::Apis::GmailV1::Draft.new(message: message)
  $service.create_user_draft($user_id, draft)
end

def get_user_info(user_id)
  data = $service.get_user_profile(user_id).to_h
  data[:email_address]
end
