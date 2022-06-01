class CreateCoworkings < ActiveRecord::Migration[7.0]
  def change
    create_table :coworkings do |t|
      t.string :name
      t.string :address
      t.text :description
      t.integer :price_per_hour

      t.timestamps
    end
  end
end
