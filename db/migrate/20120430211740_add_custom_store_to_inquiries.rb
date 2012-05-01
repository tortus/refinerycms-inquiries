class AddCustomStoreToInquiries < ActiveRecord::Migration
  def change
    add_column :refinery_inquiries_inquiries, :custom_store, :text
  end
end
