class Ico < ApplicationRecord
	def self.search(search)
		where("ico_name LIKE ? OR website LIKE ? OR symbol LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")	
	end
end

