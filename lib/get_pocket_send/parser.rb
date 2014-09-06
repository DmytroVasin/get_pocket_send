require 'open-uri'
require 'nokogiri'

module GetPocketSend
  class Parser
    class << self
      def get_title_and_link_by
        sites_and_selectors.each do |element|
          name, url, block_selector, title_selector, link_selector = element

          page = get_page_content(url)

          # p page.css(block_selector).css('h1.post-title a').first

          title_with_link = page.css(block_selector).map do |block|
            [
              block.css(title_selector).children.first,
              block.css(link_selector).first.attr('href'),
            ]
          end

          a = Hash.new()
          a[name] = title_with_link
          p a
        end
      end

      # private

      def get_page_content remote_url
        Nokogiri::HTML(open(remote_url))
      end

      # TODO: Should be grapping users file or somthing else..
      def sites_and_selectors
        [
           ['ITC', 'http://itc.ua/', '.articles header', 'h1.post-title a', 'h1.post-title a'] #,
          # ['livejournal', 'http://valerii.livejournal.com/feed', '.b-lenta-item', '.b-lenta-item-title a', '.b-lenta-item-title a']
        ]
      end
    end
  end
end
