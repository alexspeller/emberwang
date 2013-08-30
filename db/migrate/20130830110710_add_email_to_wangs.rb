class AddEmailToWangs < ActiveRecord::Migration
  def change
    add_column :wangs, :email, :string

    add_index :wangs, :email
  end
end
