class CreateIncomings < ActiveRecord::Migration
  def self.up
    create_table :incomings do |t|
      t.string :cid_number
      t.string :exten_number

      t.timestamps
    end
  end

  def self.down
    drop_table :incomings
  end
end
