class CreateProjectAuthors < ActiveRecord::Migration
  def change
    create_table :project_authors do |t|
      t.integer :project_id
      t.integer :user_id
    end

    add_index :project_authors, :project_id, :unique => true
  end
end
