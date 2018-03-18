class AddSolvingAttributeToSubmissions < ActiveRecord::Migration[5.1]
  def change
    add_column :submissions, :solving, :boolean, default: false
  end
end
