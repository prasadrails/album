class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :tag_line
      t.integer :user_id
      t.integer :album_id

      t.timestamps
    end
  end
end
