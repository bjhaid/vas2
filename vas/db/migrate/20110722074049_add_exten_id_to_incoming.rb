class AddExtenIdToIncoming < ActiveRecord::Migration
  def self.up
    add_column :incomings, :exten_id, :integer
  end

  def self.down
    remove_column :incomings, :exten_id
  end
end
