class CreateAuthors < ActiveRecord::Migration[7.0]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :bio
      t.string :email
      t.string :password_digest
      t.string :author_img

      t.timestamps
    end
  end
end
