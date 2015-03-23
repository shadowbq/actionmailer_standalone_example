# configure delivery and retrieval methods
Mail.defaults do
  retriever_method :pop3, { 
                          :address    => 'outlook.office365.com',
                          :port       => 995,
                          :user_name  => 'share@site.com',
                          :password   => 'password',
                          :enable_ssl => true    }
end
 
# retrieve first 5 messages
emails = Mail.find(:what => :first, :count => 5)
 
# or retrieve and delete from server first 5 emails
#emails = Mail.find_and_delete(:what => :first, :count => 5)
 
puts "Number of emails retrieved: #{emails.length}"
 
# loop thru all emails and print content
emails.each do |email|
 
    # email fields defined at https://github.com/mikel/mail/tree/master/lib/mail/fields
    puts "from     : " + email.from.to_s       #=> 'fromname@example.com'
    puts "to       : " + email.to.to_s         #=> 'toname@example.com'
    puts "cc       : " + email.cc.to_s         #=> 'ccname@example.com'
    puts "bcc      : " + email.bcc.to_s        #=> 'bccname@example.com'    
    
    puts "subject  : " + email.subject         #=> "This is the subject"
    puts "date     : " + email.date.to_s       #=> '26 Nov 2013 10:00:00 -0800'
    puts "messageid: " + email.message_id      #=> '<ABCD1234.12345678@xxx.xxx>'
    puts "body     : " + email.body.decoded    #=> 'This is the body of the email...    
 
end
