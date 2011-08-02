class CreateDroppeds < ActiveRecord::Migration
  def self.up
    create_table :droppeds do |t|
      t.string :exten_num

      t.timestamps
    end
  end

  def self.down
    drop_table :droppeds
  end
end
