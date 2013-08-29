class CreateWangs < ActiveRecord::Migration
  def change
    create_table :wangs do |t|
      t.string :token
      t.string :name
      t.text :description
      t.text :javascript
      t.text :style
      t.text :libraries
      t.text :templates

      t.timestamps
    end
  end
end
