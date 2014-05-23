require "rails/deprecated/sanitizer/version"
require "rails/deprecated/sanitizer/html-scanner"

module Rails
  module Deprecated
    module Sanitizer
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
end

module ActionView
  module SanitizeHelper
    def sanitized_allowed_tags
      HTML::WhiteListSanitizer.allowed_tags
    end

    def sanitized_allowed_tags=(*tags)
      HTML::WhiteListSanitizer.allowed_tags = tags
    end

    def sanitized_allowed_attributes
      HTML::WhiteListSanitizer.allowed_attributes
    end

    def sanitized_allowed_attributes=(*attributes)
      HTML::WhiteListSanitizer.allowed_attributes = attributes
    end
  end
end
