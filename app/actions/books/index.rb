# frozen_string_literal: true

module HanamiSample
  module Actions
    module Books
      class Index < HanamiSample::Action
        # NOTE: Accessing relations directly from actions is not a commonly recommended pattern.
        #  Instead, a rom repository should be used. Here, however, the repository is ommitted for brevity.
        #  Hanami's 2.1 release will offer repositories out of the box.
        include Deps["persistence.rom"]

        params do
          optional(:page).value(:integer, gt?: 0)
          optional(:per_page).value(:integer, gt?: 0, lteq?: 100)
        end

        def handle(request, response)
          halt 422, {errors: request.params.errors}.to_json unless request.params.valid?

          books = rom.relations[:books]
                     .select(:title, :author)
                     .order(:title)
                     .page(request.params[:page] || 1)
                     .per_page(request.params[:per_page] || 5)
                     .to_a

          response.format = :json
          response.body = books.to_json
        end
      end
    end
  end
end
