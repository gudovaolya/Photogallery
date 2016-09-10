class CreatePhotocomments < ActiveRecord::Migration[5.0]
  def change
    create_table :photocomments do |t|
      t.text :content
      t.integer :score
      t.references :photo, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
