class CreateDoctors < ActiveRecord::Migration[7.0]
  def change
    create_table :doctors do |t|
      t.string :email
      t.string :firstname
      t.string :lastname
      t.string :password_digest

      t.timestamps
    end
  end
end
