class AddBillingInformationToClients < ActiveRecord::Migration[5.0]
  def up
    add_column :clients, :billing_contact, :string
    add_column :clients, :billing_company, :string
    add_column :clients, :billing_address1, :string
    add_column :clients, :billing_address2, :string
    add_column :clients, :billing_city, :string
    add_column :clients, :billing_state, :string
    add_column :clients, :billing_zip, :string
    add_column :clients, :billing_phone, :string
  end

  def down
    remove_column :clients, :billing_contact
    remove_column :clients, :billing_company
    remove_column :clients, :billing_address1
    remove_column :clients, :billing_address2
    remove_column :clients, :billing_city
    remove_column :clients, :billing_state
    remove_column :clients, :billing_zip
    remove_column :clients, :billing_phone
  end
end
