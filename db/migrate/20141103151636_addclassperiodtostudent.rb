class Addclassperiodtostudent < ActiveRecord::Migration
  def change
  	add_column :users, :classperiod, :reference
  end
end
