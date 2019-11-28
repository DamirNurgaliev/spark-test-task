class CreateBulkUploadAttachment < ActiveRecord::Migration[5.1]
  def change
    create_table :bulk_upload_attachments do |t|
      t.attachment :file

      t.timestamps
    end
  end
end
