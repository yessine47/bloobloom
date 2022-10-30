class CreateLenses < ActiveRecord::Migration[7.0]
  def change
    create_table :lenses do |t|
      t.string :Colour
      t.text :Description
      t.integer :Prescription_type
      t.integer :Lens_type
      t.integer :Stock
      t.float :Price

      t.timestamps
    end
  end
end
