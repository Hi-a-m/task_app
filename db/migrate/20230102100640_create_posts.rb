class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :start_at
      t.date :end_at
      t.boolean :is_all_day
      t.datetime :update_schedule
      t.text :memo

      t.timestamps
    end
  end
end
