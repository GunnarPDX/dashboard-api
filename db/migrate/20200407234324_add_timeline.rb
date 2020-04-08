class AddTimeline < ActiveRecord::Migration[6.0]
  def change
    create_table :timelines do |t|
      t.string :data
      t.timestamps
    end
  end
end
