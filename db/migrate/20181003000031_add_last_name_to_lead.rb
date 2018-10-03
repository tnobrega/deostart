class AddLastNameToLead < ActiveRecord::Migration[5.2]
  def change
    add_column :leads, :last_name, :string
  end
end
