# encoding: utf-8

require './lib/get_pocket_send/parser'

module GetPocketSend
  class MyPockety
    def start
      # puts 'This is get_pocket. Coming in loud and clear. Over and over!'
      p Parser.get_title_and_link_by
    end
  end
end
