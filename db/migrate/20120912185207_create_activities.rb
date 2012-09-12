class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.boolean :is_in
      t.string :description

      t.timestamps
    end
  end
end
