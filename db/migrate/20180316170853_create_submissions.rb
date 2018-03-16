class CreateSubmissions < ActiveRecord::Migration[5.1]
  def change
    create_table :submissions do |t|
      t.text :source
      t.integer :points
      t.references :contestant, foreign_key: true
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
