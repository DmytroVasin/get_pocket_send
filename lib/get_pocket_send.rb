# encoding: utf-8

require './lib/get_pocket_send/parser'
require './lib/get_pocket_send/messages'
require './lib/get_pocket_send/email_sender'

module GetPocketSend
  class CLI
    include Messages
    include EmailSender

    # [TODO] No needed declaration...
    attr_accessor :input, :output, :email, :password
    def initialize email, password
      self.input  = $stdin
      self.output = $stdout

      @email = email
      @password = password
    end


    def start
      error_handler do
        hash = Parser.get_title_and_link_by

        hash.each do |key, value|
          message_current_site(key)

          value.each_with_index do |title_and_link, index|
            title = title_and_link[0]
            link  = title_and_link[1]

            # need to use block of code...
            puts "#{index + 1}: #{title}"
            puts "( #{link} )"

            message_save_article?

            if handling_permission?
              send_email_with({ body: link, subject: title })
            else
              message_next
              next
            end
          end
        end
      end
    end

    def error_handler
      begin
        yield
      rescue SystemExit
        message_goodbie
      end
    end
  end
end
