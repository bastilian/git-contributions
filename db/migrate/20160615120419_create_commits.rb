class CreateCommits < ActiveRecord::Migration
  def change
    create_table :commits do |t|
      t.references :author, index: true, foreign_key: true
      t.references :repository, index: true, foreign_key: true
      t.integer :deletions
      t.integer :additions
      t.datetime :committed_at

      t.timestamps null: false
    end
  end
end
