class CreatePlants < ActiveRecord::Migration[5.2]
  def change
    create_table :plants do |t|
      t.string :common_name
      t.string :scientific_name
      t.text :description
    end
  end
end
