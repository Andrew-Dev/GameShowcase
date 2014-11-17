class Game < ActiveRecord::Base
	belongs_to :user	
	has_many :comments
	has_many :favorites
	mount_uploader :main_screenshot, MainScreenshotUploader
	mount_uploader :file, MainFileUploader
	validates :title, presence: true, length: { maximum: 40 }
	validates :description, presence: true
	validates :main_screenshot, presence: true
	validates :file, presence: true
	
	validate :codeWorks?

	def getGameClassPeriod
		return Classperiod.find_by(code: self.code)
	end
	def codeWorks?
		if Classperiod.find_by(code: self.code) != nil
			return true
		else
			errors.add(:game,"class code invalid.")
			return false
		end
	end
	def userHasFavorited?(user)
		uservotes = Favorite.where("game_id = #{user.id} AND user_id = #{current_user.id}").count
		if uservotes == 0
			return false
		else
			return false
		end
	end
end
