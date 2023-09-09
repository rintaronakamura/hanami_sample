# frozen_string_literal: true

module HanamiSample
  module Actions
    module Books
      class Index < HanamiSample::Action
        # NOTE: Accessing relations directly from actions is not a commonly recommended pattern.
        #  Instead, a rom repository should be used. Here, however, the repository is ommitted for brevity.
        #  Hanami's 2.1 release will offer repositories out of the box.
        include Deps["persistence.rom"]

        def handle(*, response)
          books = rom.relations[:books]
                     .select(:title, :author)
                     .order(:title)
                     .to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
