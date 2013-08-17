class CreateStrains < ActiveRecord::Migration
  def change
    create_table :strains do |t|
      t.string :name
      t.string :category
      t.string :abstract
      t.integer :rating

      t.timestamps
    end
  end
end
