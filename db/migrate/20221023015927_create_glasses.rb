class CreateGlasses < ActiveRecord::Migration[7.0]
  def change
    create_table :glasses do |t|
      t.decimal :Price
      t.references :frame, null: false, foreign_key: true
      t.references :lense, null: false, foreign_key: true

      t.timestamps
    end
  end
end
