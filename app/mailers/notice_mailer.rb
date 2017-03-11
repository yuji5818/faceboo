class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_topic.subject
  #
  def sendmail_topic
    @greeting = "Hi"

    mail to: "yuji05225818@gmail.com",
     subject: '【faceboo】topicが投稿されました'
  end
end
