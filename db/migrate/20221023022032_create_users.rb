class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :Name
      t.string :Email
      t.string :password_digest
      t.integer :Currency
      t.boolean :IsAdmin

      t.timestamps
    end
  end
end
