class CreateFrames < ActiveRecord::Migration[7.0]
  def change
    create_table :frames do |t|
      t.string :Name
      t.text :Description
      t.integer :Status
      t.integer :Stock
      t.float :Price

      t.timestamps
    end
  end
end
