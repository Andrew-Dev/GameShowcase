class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title
      t.text :description, :limit => 4294967295
      t.string :file
      t.references :user

      t.timestamps
    end
  end
end
