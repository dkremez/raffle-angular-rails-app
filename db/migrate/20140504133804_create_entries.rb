class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :name
      t.integer :win_times, :default => 0
      t.boolean :winner

      t.timestamps
    end
  end
end
