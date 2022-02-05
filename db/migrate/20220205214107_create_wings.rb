class CreateWings < ActiveRecord::Migration[6.1]
  def change
    create_table :wings do |t|
      t.string :name
      t.timestamps
    end
  end
end
