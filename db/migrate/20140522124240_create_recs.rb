class CreateRecs < ActiveRecord::Migration
  def change
    create_table :recs do |t|
      t.text :content
      t.references :user, index: true
      t.datetime :posted_on

      t.timestamps
    end
  end
end
