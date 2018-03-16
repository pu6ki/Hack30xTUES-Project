class CreateRecruiters < ActiveRecord::Migration[5.1]
  def change
    create_table :recruiters do |t|
      t.string :company_name
      t.string :website
      t.text :description

      t.timestamps
    end
  end
end
