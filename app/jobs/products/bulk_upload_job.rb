module Products
  class BulkUploadJob < ApplicationJob
    queue_as :default

    def perform(attachment_id)
      attachment = Products::BulkUploadAttachment.find(attachment_id)

      return unless attachment

      parse_csv(attachment)
    end

    private

    def parse_csv(attachment)
      file = File.open(attachment.file.url)

      ::Spree::Admin::Products::Imports::CreateService.call(file)
    end
  end
end
