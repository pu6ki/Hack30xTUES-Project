class CreateTestCases < ActiveRecord::Migration[5.1]
  def change
    create_table :test_cases do |t|
      t.string :expected_output
      t.references :contest, foreign_key: true

      t.timestamps
    end
  end
end
