class CreateSmokeins < ActiveRecord::Migration
  def change
    create_table :smokeins do |t|
      t.integer :user_id
      t.integer :strain_id

      t.timestamps
    end
  end
end
