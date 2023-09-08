# frozen_string_literal: true

module HanamiSample
  module Actions
    module Books
      class Index < HanamiSample::Action
        def handle(*, response)
          books = [
            { "title" => "Test Driven Development" },
            { "title" => "Practical Object-Oriented Design in Ruby" }
          ]

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
