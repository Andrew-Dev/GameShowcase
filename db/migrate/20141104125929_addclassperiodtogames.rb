class Addclassperiodtogames < ActiveRecord::Migration
  def change
  	add_column :games, :classperiod_id, :integer
  end
end
