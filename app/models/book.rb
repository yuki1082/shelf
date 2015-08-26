class Book < ActiveRecord::Base
  attr_accessible :authors, :checked_out, :comment, :integer, :publish_year, :title
  belongs_to :category
  scope :checked_in, where(checked_out: false).order("publish_year")
  scope :checked_out, where(checked_out: true).order("publish_year")
  scope :search, lambda{|q|
  	where(["title LIKE ?", "%#{q}%"])
  }

  validates :title, presence: true, length:{maximum: 80}
  validates :authors, presence: true, length: {maximum: 80}
  validates :comment, presence: true, length: {maximum: 400}
  validate  :check_association

  private
  def check_association
    if category_id && Category.where(id: category_id).exists?
      errors.add(:base, :missing_category)
      self.category_id = nil
    end 
  end 
end
