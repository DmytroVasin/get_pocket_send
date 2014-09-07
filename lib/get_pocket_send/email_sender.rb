require 'net/smtp'

module GetPocketSend
  module EmailSender
    def send_email_with(opts={})
      opts[:domain]  ||= 'gmail.com'
      opts[:pocket]  ||= 'add@getpocket.com'

      opts[:subject] ||= "You need to see this"
      opts[:body]    ||= "http://www.lostfilm.tv/"

      msg = "Subject: #{opts[:subject]} \n\n #{opts[:body]}"
      smtp = Net::SMTP.new 'smtp.gmail.com', 587
      smtp.enable_starttls
      smtp.start(opts[:domain], email, password, :login) do
        smtp.send_message(msg, email, opts[:pocket])
      end

      message_sent
    end
  end
end
