require 'httparty'
require 'json'
require 'time'
class SendVoteNotificationEnd
  include Interactor
  def call
    send_notification_end
  end
  private

  def send_notification_end
    message = { text: 'Les votes sont fermés' }

    message_json = message.to_json

    response = HTTParty.post(
      'https://hooks.slack.com/services/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',
      body: message_json,
      headers: { 'Content-Type' => 'application/json' }
    )
  end
end