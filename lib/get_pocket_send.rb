# encoding: utf-8

require './lib/get_pocket_send/parser'

module GetPocketSend
  class MyPockety
    def start
      # puts 'This is get_pocket. Coming in loud and clear. Over and over!'
      hash = Parser.get_title_and_link_by

      hash.each do |key, value|
        puts "------- Site Name -------"
        puts key
        puts "------- Site Name -------"

        value.each_with_index do |title_and_link, index|
          title = title_and_link[0]
          link  = title_and_link[1]

          puts "#{index + 1}: #{title}"
          puts "( #{link} )"
          puts "-----------------"
        end
      end
    end
  end
end
