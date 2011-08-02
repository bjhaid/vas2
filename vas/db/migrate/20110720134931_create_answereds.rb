class CreateAnswereds < ActiveRecord::Migration
  def self.up
    create_table :answereds do |t|
      t.string :exten_num

      t.timestamps
    end
  end

  def self.down
    drop_table :answereds
  end
end
