class Classperiod < ActiveRecord::Base
	has_many :games
	#has_many :users, through: 'userclassperiod'
end
