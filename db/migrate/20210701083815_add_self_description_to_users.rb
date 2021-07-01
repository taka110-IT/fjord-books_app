class AddSelfDescriptionToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :self_description, :text
  end
end
