class CreateAcknowledges < ActiveRecord::Migration[6.1]
  def change
    create_table :acknowledges do |t|
      t.belongs_to :note, index: true, foreign_key: true
      t.belongs_to :user, index: true, foreign_key: true
      t.timestamps
    end
  end
end
