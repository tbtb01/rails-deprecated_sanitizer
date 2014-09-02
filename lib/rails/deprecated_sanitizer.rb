require "rails/deprecated_sanitizer/version"
require "rails/deprecated_sanitizer/html-scanner"
require "rails/deprecated_sanitizer/railtie" if defined?(Rails::Railtie)
require "active_support/core_ext/module/remove_method"

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
      module ClassMethods
        remove_possible_method(:sanitizer_vendor)
        def sanitizer_vendor
          Rails::DeprecatedSanitizer
        end

        remove_possible_method(:sanitized_protocol_separator)
        def sanitized_protocol_separator
          white_list_sanitizer.protocol_separator
        end

        remove_possible_method(:sanitized_uri_attributes)
        def sanitized_uri_attributes
          white_list_sanitizer.uri_attributes
        end

        remove_possible_method(:sanitized_bad_tags)
        def sanitized_bad_tags
          white_list_sanitizer.bad_tags
        end

        remove_possible_method(:sanitized_allowed_tags)
        def sanitized_allowed_tags
          white_list_sanitizer.allowed_tags
        end

        remove_possible_method(:sanitized_allowed_attributes)
        def sanitized_allowed_attributes
          white_list_sanitizer.allowed_attributes
        end

        remove_possible_method(:sanitized_allowed_css_properties)
        def sanitized_allowed_css_properties
          white_list_sanitizer.allowed_css_properties
        end

        remove_possible_method(:sanitized_allowed_css_keywords)
        def sanitized_allowed_css_keywords
          white_list_sanitizer.allowed_css_keywords
        end

        remove_possible_method(:sanitized_shorthand_css_properties)
        def sanitized_shorthand_css_properties
          white_list_sanitizer.shorthand_css_properties
        end

        remove_possible_method(:sanitized_allowed_protocols)
        def sanitized_allowed_protocols
          white_list_sanitizer.allowed_protocols
        end

        remove_possible_method(:sanitized_protocol_separator=)
        def sanitized_protocol_separator=(value)
          white_list_sanitizer.protocol_separator = value
        end

        remove_possible_method(:sanitized_uri_attributes=)

        # Adds valid HTML attributes that the +sanitize+ helper checks for URIs.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_uri_attributes = 'lowsrc', 'target'
        #   end
        #
        def sanitized_uri_attributes=(attributes)
          HTML::WhiteListSanitizer.uri_attributes.merge(attributes)
        end

        remove_possible_method(:sanitized_bad_tags=)

        # Adds to the Set of 'bad' tags for the +sanitize+ helper.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_bad_tags = 'embed', 'object'
        #   end
        #
        def sanitized_bad_tags=(attributes)
          HTML::WhiteListSanitizer.bad_tags.merge(attributes)
        end

        remove_possible_method(:sanitized_allowed_tags=)

        # Adds to the Set of allowed tags for the +sanitize+ helper.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_allowed_tags = 'table', 'tr', 'td'
        #   end
        #
        def sanitized_allowed_tags=(attributes)
          HTML::WhiteListSanitizer.allowed_tags.merge(attributes)
        end

        remove_possible_method(:sanitized_allowed_attributes=)

        # Adds to the Set of allowed HTML attributes for the +sanitize+ helper.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_allowed_attributes = ['onclick', 'longdesc']
        #   end
        #
        def sanitized_allowed_attributes=(attributes)
          HTML::WhiteListSanitizer.allowed_attributes.merge(attributes)
        end

        remove_possible_method(:sanitized_allowed_css_properties=)

        # Adds to the Set of allowed CSS properties for the #sanitize and +sanitize_css+ helpers.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_allowed_css_properties = 'expression'
        #   end
        #
        def sanitized_allowed_css_properties=(attributes)
          HTML::WhiteListSanitizer.allowed_css_properties.merge(attributes)
        end

        remove_possible_method(:sanitized_allowed_css_keywords=)

        # Adds to the Set of allowed CSS keywords for the +sanitize+ and +sanitize_css+ helpers.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_allowed_css_keywords = 'expression'
        #   end
        #
        def sanitized_allowed_css_keywords=(attributes)
          HTML::WhiteListSanitizer.allowed_css_keywords.merge(attributes)
        end

        remove_possible_method(:sanitized_shorthand_css_properties=)

        # Adds to the Set of allowed shorthand CSS properties for the +sanitize+ and +sanitize_css+ helpers.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_shorthand_css_properties = 'expression'
        #   end
        #
        def sanitized_shorthand_css_properties=(attributes)
          HTML::WhiteListSanitizer.shorthand_css_properties.merge(attributes)
        end

        remove_possible_method(:sanitized_allowed_protocols=)

        # Adds to the Set of allowed protocols for the +sanitize+ helper.
        #
        #   class Application < Rails::Application
        #     config.action_view.sanitized_allowed_protocols = 'ssh', 'feed'
        #   end
        #
        def sanitized_allowed_protocols=(attributes)
          HTML::WhiteListSanitizer.allowed_protocols.merge(attributes)
        end
      end
    end
  end
end
