class User < ActiveRecord::Base
  has_one :game
  has_one :classperiod, through: 'userclassperiods'
  has_many :comments
  has_many :favorites
  validates :firstname, :presence => true
  validates :lastname, :presence => true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def getFullName
    return "#{self.firstname} #{self.lastname}"
  end

  def to_s
    getFullName
  end

  
end
