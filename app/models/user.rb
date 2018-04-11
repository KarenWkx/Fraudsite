class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def self.search(search)
  	where("ico_name LIKE ? OR website LIKE ? OR symbol LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")	
  end

end
