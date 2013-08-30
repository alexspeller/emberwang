class AddScriptLanguageToWangs < ActiveRecord::Migration
  def change
    add_column :wangs, :script_language, :string
  end
end
