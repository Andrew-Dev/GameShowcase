class AddScreenshotsToGames < ActiveRecord::Migration
  def change
  	add_column :games, :main_screenshot, :string
  end
end
