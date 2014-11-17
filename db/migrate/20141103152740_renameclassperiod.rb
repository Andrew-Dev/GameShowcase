class Renameclassperiod < ActiveRecord::Migration
  def change
  	add_column :users, :classperiod_id, :reference
  end
end
