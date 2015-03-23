require 'rubygems'
require 'mail'

smtp = { 
        :address => 'smtp.office365.com', 
        :port => 587, 
        :domain => 'site.com', 
        :user_name => 'share@site.com', 
        :password => 'my_password', 
        :enable_starttls_auto => true, 
        :openssl_verify_mode => 'none' 
        }

Mail.defaults { delivery_method :smtp, smtp }

mail = Mail.new do
  from 'share@site.com'
  to 'shadowbq@gmail.com'
  subject 'subject'
  body 'body'
end

mail.deliver!
