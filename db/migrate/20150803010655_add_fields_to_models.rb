class AddFieldsToModels < ActiveRecord::Migration
  def change
    add_column :models, :admin, :boolean
    add_column :models, :first_name, :string
    add_column :models, :last_name, :string
  end
end
