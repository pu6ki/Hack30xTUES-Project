class RemoveDescriptionFromRecruiters < ActiveRecord::Migration[5.1]
  def change
    remove_column :recruiters, :description, :string
  end
end
