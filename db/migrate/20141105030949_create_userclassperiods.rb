class CreateUserclassperiods < ActiveRecord::Migration
  def change
    create_table :userclassperiods do |t|
      t.references :classperiod
      t.references :user
      t.timestamps
    end
  end
end
