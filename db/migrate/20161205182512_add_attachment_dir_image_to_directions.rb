class AddAttachmentDirImageToDirections < ActiveRecord::Migration
  def self.up
    change_table :directions do |t|
      t.attachment :dir_image
    end
  end

  def self.down
    remove_attachment :directions, :dir_image
  end
end
