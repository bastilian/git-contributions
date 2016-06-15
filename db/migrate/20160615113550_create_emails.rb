class CreateEmails < ActiveRecord::Migration
  def change
    create_table :emails do |t|
      t.references :author, index: true, foreign_key: true
      t.string :address

      t.timestamps null: false
    end
  end
end
