class CreateWingNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :wing_notes do |t|
      t.references :wings
      t.references :notes
      t.timestamps
    end
  end
end
