module Spree
  module Admin
    module Products
      class BulkUploadsController < Spree::Admin::BaseController
        def create
          puts "123"
        end

        private

        def bulk_upload_params
          params.permit(:file)
        end
      end
    end
  end
end
