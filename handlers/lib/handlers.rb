require 'action_view/template'
require 'rdiscount'
require 'handlers/railtie'

module Handlers
  module MERB
    def self.erb_handler
      @@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
    end

    def self.call(template)
      compiled_source = erb_handler.call(template)
      if template.formats.include?(:html)
        "RDiscount.new(begin;#{compiled_source};end).to_html"
      else
        compiled_source
      end
    end
  end
end

ActionView::Template.register_template_handler :rb, :source.to_proc
ActionView::Template.register_template_handler :string, ->(template) { "%Q{#{template.source}}" }
ActionView::Template.register_template_handler :md, ->(template) { "RDiscount.new(#{template.source.inspect}).to_html" }
ActionView::Template.register_template_handler :merb, Handlers::MERB
