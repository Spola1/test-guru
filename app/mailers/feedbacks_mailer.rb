class FeedbacksMailer < ActionMailer::Base
  default from: "TestGuru user"
  layout 'mailer'

  def send_feedback(feedback)
    @user = feedback.user
    @subject = feedback.subject
    @comment = feedback.comment
    mail to: 'alexeihowar50@gmail.com'
  end

end
