require "rails/deprecated_sanitizer/version"
require "rails/deprecated_sanitizer/html-scanner"

module Rails
  module DeprecatedSanitizer
    extend self

    def full_sanitizer
      HTML::FullSanitizer
    end

    def link_sanitizer
      HTML::LinkSanitizer
    end

    def white_list_sanitizer
      HTML::WhiteListSanitizer
    end
  end
end

module ActionView
  module Helpers
    module SanitizeHelper
      def self.sanitizer_vendor
        Rails::DeprecatedSanitizer
      end
    end
  end
end
