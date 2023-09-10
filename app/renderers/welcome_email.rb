# frozen_string_literal: true

module HanamiSample
  module Renderers
    class WelcomeEmail
      def render_html(name:)
        "<p>Welcome to Bookshelf #{name}!</p>"
      end

      def render_text(name:)
        "Welcome to Bookshelf #{name}!"
      end
    end
  end
end
