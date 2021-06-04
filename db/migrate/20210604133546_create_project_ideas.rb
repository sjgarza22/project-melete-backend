class CreateProjectIdeas < ActiveRecord::Migration[6.0]
  def change
    create_table :project_ideas do |t|
      t.string :title
      t.string :details
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
