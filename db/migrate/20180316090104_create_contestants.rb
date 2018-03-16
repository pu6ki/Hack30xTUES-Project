class CreateContestants < ActiveRecord::Migration[5.1]
  def change
    create_table :contestants do |t|
      t.string :first_name
      t.string :last_name
      t.references :school, foreign_key: true

      t.timestamps
    end
  end
end
