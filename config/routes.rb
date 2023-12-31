# frozen_string_literal: true

module HanamiSample
  class Routes < Hanami::Routes
    root to: "home.show"
    # get "/home/:id", to: "home.show"
    get "/books", to: "books.index"
    get "/books/:id", to: "books.show"
    post "/books", to: "books.create"
  end
end
