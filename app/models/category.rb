require "nkf"
class Category < ActiveRecord::Base
 attr_accessible :name, :color
 validates :name, presence: true
 validates :name, uniqueness: {case_senstive: false} 
 validates :color, presence: true
 has_many :books, dependent: :nullify
 before_validation :normalize_values

 
 private
 def normalize_values
 	if name.present?
 		self.name = NKF.nkf("-WwZ", name)
 		self.name = name.strip
 	end 
 end 


end
