class CreateFoods < ActiveRecord::Migration[7.0]
  def change
    create_table :foods do |t|
      t.string :Name
      t.integer :Measurement_id
      t.integer :Price
      t.string :Quantity
      t.string :integer

      t.timestamps
    end
  end
end
