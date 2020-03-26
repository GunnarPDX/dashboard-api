class CreateApiModels < ActiveRecord::Migration[6.0]
  def change
    create_table :totals do |t|
      t.string :data
      t.timestamps
    end

    create_table :countries do |t|
      t.string :data
      t.timestamps
    end

    create_table :news do |t|
      t.string :data
      t.timestamps
    end
  end
end
