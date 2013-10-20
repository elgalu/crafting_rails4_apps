class Notifier < ActionMailer::Base
  def contact(recipient)
    @recipient = recipient

    mail to: @recipient, from: 'john.doe@example.com' do |format|
      # specify wich templates to render (when more than one => multipart email)
      format.text
      format.html
    end
  end
end
