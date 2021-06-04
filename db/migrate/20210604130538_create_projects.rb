class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :create_projects do |t|
      t.string :title
      t.string :details
      t.integer :user_id

      t.timestamps
    end
  end
end
