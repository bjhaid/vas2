class CreateExtens < ActiveRecord::Migration
  def self.up
    create_table :extens do |t|
      t.string :exten_number

      t.timestamps
    end
  end

  def self.down
    drop_table :extens
  end
end
