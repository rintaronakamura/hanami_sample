# frozen_string_literal: true

# NOTE: Hanami makes this style of dependency injection simple through its Deps mixin.
# Built into the component management system, and invoked through the use of include Deps["key"],
# the Deps mixin allows a component to use any other component in its container as a dependency,
# while removing the need for any attr_reader or initializer boilerplate.
#
# require "acme_email/client"
#
# module HanamiSample
#   module Operations
#     class SendWelcomeEmail
#       attr_reader :email_client
#       attr_reader :email_renderer
#
#       def initialize(email_client:, email_renderer:)
#         @email_client = email_client
#         @email_renderer = email_renderer
#       end
#
#       def call(name:, email_address:)
#         email_client.deliver(
#           to: email_address,
#           subject: "Welcome!",
#           text_body: email_renderer.render_text(name: name),
#           html_body: email_renderer.render_html(name: name)
#         )
#       end
#     end
#   end
# end
module HanamiSample
  module Operations
    class SendWelcomeEmail
      include Deps[
        "email_client",
        "renderers.welcome_email"
      ]

      def call(name:, email_address:)
        email_client.deliver(
          to: email_address,
          subject: "Welcome!",
          text_body: welcome_email.render_text(name: name),
          html_body: welcome_email.render_html(name: name)
        )
      end
    end
  end
end
