require 'rubygems'
require 'action_mailer'

ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
   :address   => "smtp.office365.com",
   :port      => 587,
   :domain    => "site.com",
   :authentication => :login,
   :user_name      => "share@site.com",
   :password       => "my_password",
   :enable_starttls_auto => true
  }
ActionMailer::Base.view_paths= File.dirname(__FILE__)

class Mailer < ActionMailer::Base

  def daily_email
    @var = Random.rand(256)

    mail(   :to      => "shadowbq@gmail.com",
            :from    => "share@site.com",
            :subject => "Test mail random - #{@var}") do |format|
                format.text
                format.html
    end
  end
end

email = Mailer.daily_email
puts email
email.deliver
