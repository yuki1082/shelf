class Book < ActiveRecord::Base
  attr_accessible :authors, :checked_out, :comment, :integer, :publish_year, :title
end
