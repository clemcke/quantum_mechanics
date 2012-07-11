class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :name
      t.string :source_url
      t.date :recorded_on

      t.timestamps
    end
  end
end
