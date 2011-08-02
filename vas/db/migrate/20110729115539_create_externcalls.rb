class CreateExterncalls < ActiveRecord::Migration
  def self.up
    create_table :externcalls do |t|
      t.string :a
      t.string :b

      t.timestamps
    end
  end

  def self.down
    drop_table :externcalls
  end
end
