class ProjectStageJoinTable < ActiveRecord::Migration
  def change
    create_join_table :projects, :stages do |t|
      # t.index [:project_id, :stage_id]
      # t.index [:stage_id, :project_id]
    end
  end
end
