# frozen_string_literal: true

module HanamiSample
  module Actions
    module Home
      class Show < HanamiSample::Action
        def handle(*, response)
          response.body = "Welcome to Bookshelf"
        end
      end
    end
  end
end
