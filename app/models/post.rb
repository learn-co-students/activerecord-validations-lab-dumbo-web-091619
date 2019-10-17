class Post < ActiveRecord::Base
  include ActiveModel::Validations 
  validates :title, presence: true, uniqueness: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with TitleValidator 
end
