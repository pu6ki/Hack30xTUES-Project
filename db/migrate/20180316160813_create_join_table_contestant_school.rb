class CreateJoinTableContestantSchool < ActiveRecord::Migration[5.1]
  def change
    create_join_table :contestants, :schools do |t|
      t.index [:contestant_id, :school_id]
      # t.index [:school_id, :contestant_id]
    end
  end
end
