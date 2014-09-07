module GetPocketSend
  module Messages
    def message_save_article?
      output.puts "Save this article? #{yes} / #{no} / #{close}"
    end

    def message_goodbie
      output.puts goodbie
    end

    def handling_permission
      permition = input.gets.chomp

      case permition
      when 'y', 'yes'
        true
      when 'n', 'no'
        false
      when 'c', 'close'
        raise SystemExit
      else
        message_save_article?
        handling_permission
      end
    end

    private
    def yes
      "\033[32m[yes]y\033[0m"
    end

    def no
      "\033[33m[no]n\033[0m"
    end

    def close
      "\033[31m[close]c\033[0m"
    end

    def goodbie
      "\033[33mGoodbye...\033[0m"
    end
  end
end
