class AddInputToTestCases < ActiveRecord::Migration[5.1]
  def change
    add_column :test_cases, :input, :string
  end
end
