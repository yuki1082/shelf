class Category < ActiveRecord::Base
 attr_accessible :name, :color
 validates :name, presence: true
 validates :color, presence: true
 has_many :books
end
