class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.string :title
      t.boolean :require_ack
      t.integer :bump
      t.text :content
      t.timestamps
    end
  end
end
