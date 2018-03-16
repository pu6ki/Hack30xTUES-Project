class CreateJoinTableRecruiterTechnology < ActiveRecord::Migration[5.1]
  def change
    create_join_table :recruiters, :technologies do |t|
      t.index [:recruiter_id, :technology_id], name: 'recruiter_technologies'
      # t.index [:technology_id, :recruiter_id]
    end
  end
end
