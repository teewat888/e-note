class CreateWingNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :note_wings do |t|
      t.belongs_to :note, index: true, foreign_key: true
      t.belongs_to :wing, index: true, foreign_key: true
      t.timestamps
    end
  end
end
