class AddAttachmentToSongs < ActiveRecord::Migration
  def up
    change_table :songs do |t|
      t.has_attached_file :file
    end
  end

  def down
    drop_attached_file :songs, :file
  end
end
