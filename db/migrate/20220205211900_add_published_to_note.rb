class AddPublishedToNote < ActiveRecord::Migration[6.1]
  def change
    add_column :notes, :published, :boolean, :default => true

  end
end
