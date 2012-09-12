class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.boolean :in
      t.string :description

      t.timestamps
    end
  end
end
