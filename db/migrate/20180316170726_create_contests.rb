class CreateContests < ActiveRecord::Migration[5.1]
  def change
    create_table :contests do |t|
      t.string :title
      t.string :position
      t.text :description
      t.references :recruiter, foreign_key: true
      t.references :technology, foreign_key: true
      t.datetime :deadline

      t.timestamps
    end
  end
end
