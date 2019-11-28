module Spree
  module Admin
    module Products
      class BulkUploadsController < Spree::Admin::BaseController
        def create
          file = Products::BulkUploadAttachment.new(file: bulk_upload_params[:file])

          if file.save
            Products::BulkUpload.perform_later(file.id)

            flash[:success] = "Success"
          else
            flash[:error] = "Error"
          end

          redirect_to admin_products_path
        end

        private

        def bulk_upload_params
          params.permit(:file)
        end
      end
    end
  end
end
