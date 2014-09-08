module GetPocketSend
  module Messages
    def message_save_article
      output.puts "Save this article? #{yes} / #{no} / #{close}"
    end

    def message_goodbie
      show_message goodbie
    end

    def message_sent
      show_message sent
    end

    def message_next
      show_message the_next
    end

    def message_current_site site_name
      output.puts "------- Site Name -------"
      output.puts site_name
      output.puts "------- Site Name -------"
    end

    # [TODO]: make it be refinement/using String class...
    def handling_permission?
      permition = input.gets.chomp

      case permition
      when 'y', 'yes'
        true
      when 'n', 'no'
        false
      when 'c', 'close'
        raise SystemExit
      else
        message_save_article
        handling_permission?
      end
    end

    private
    def show_message msg
      output.puts msg
      output.puts "-------------------------"
    end

    def yes
      "\033[32m[yes]y\033[0m"
    end

    def no
      "\033[33m[no]n\033[0m"
    end

    def close
      "\033[31m[close]c\033[0m"
    end

    def the_next
      "\033[33mNext...\033[0m"
    end

    def goodbie
      "\033[33mGoodbye...\033[0m"
    end

    def sent
      "\033[32mSent...\033[0m"
    end
  end
end
