class CreateAjaxcalls < ActiveRecord::Migration
  def self.up
    create_table :ajaxcalls do |t|
      t.string :cid_number
      t.string :exten_number

      t.timestamps
    end
  end

  def self.down
    drop_table :ajaxcalls
  end
end
