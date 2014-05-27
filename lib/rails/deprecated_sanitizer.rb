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
      extend self

      def sanitizer_vendor
        Rails::DeprecatedSanitizer
      end

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
end
