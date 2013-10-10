class ContactForm < MailForm::Base
  attributes :name, :email, :message

  attributes :nickname
  validates :nickname, absence: true

  def headers
    { to: 'recipient@example.com', from: self.email }
  end
end
