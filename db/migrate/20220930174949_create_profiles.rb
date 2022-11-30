class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :username, limit: 255, null: false, unique: true, index: true
      t.boolean :superuser, null: false, default: false
      t.timestamps
    end
  end
end
