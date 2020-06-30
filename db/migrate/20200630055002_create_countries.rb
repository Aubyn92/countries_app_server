class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.text :description
      t.string :airline
      t.integer :year

      t.timestamps
    end
  end
end
