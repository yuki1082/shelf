class Book < ActiveRecord::Base
  attr_accessible :authors, :checked_out, :comment, :integer, :publish_year, :title
  scope :checked_in, where(checked_out: false).order("publish_year")
  scope :checked_out, where(checked_out: true).order("publish_year")
  scope :search, lambda{|q|
  	where(["title LIKE ?", "%#{q}%"])
  }
end
