class CreateFinances < ActiveRecord::Migration[5.0]
  def change
    create_table :finances do |t|
      t.string :symbol
      t.string :price

      t.timestamps
    end
  end
end
