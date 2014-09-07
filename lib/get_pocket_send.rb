# encoding: utf-8

require './lib/get_pocket_send/parser'
require './lib/get_pocket_send/messages'

module GetPocketSend
  class CLI
    include Messages

    # [TODO] No needed declaration...
    attr_accessor :input, :output
    def initialize
      self.input  = $stdin
      self.output = $stdout
    end


    def start
      error_handler do
        hash = Parser.get_title_and_link_by

        hash.each do |key, value|
          puts "------- Site Name -------"
          puts key
          puts "------- Site Name -------"

          value.each_with_index do |title_and_link, index|
            title = title_and_link[0]
            link  = title_and_link[1]

            # need to use block of code...
            puts "#{index + 1}: #{title}"
            puts "( #{link} )"

            message_save_article?

            handling_permission

            puts "-----------------"

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
