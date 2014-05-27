require "rails/deprecated_sanitizer/version"
require "rails/deprecated_sanitizer/html-scanner"
require "active_support/lazy_load_hooks"

module Rails
  module DeprecatedSanitizer
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

ActiveSupport.on_load(:action_view) do
  ActionView::SanitizeHelper.sanitizer_vendor = Rails::Deprecated::Sanitizer
end
