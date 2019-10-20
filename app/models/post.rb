class Post < ActiveRecord::Base
  validates :title, presence: true
  validate :clickbait?
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  # validates :title, exclusion: {in:  [
  #   /Won't Believe/i,
  #   /Secret/i,
  #   /Top [0-9]*/i,
  #   /Guess/i
  # ]}

  # clickbait = [/Won't Believe/i,/Secret/i,/Top [0-9]*/i,/Guess/i]
  CLICKBAIT = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]
  def clickbait?
  if CLICKBAIT.none? {|elem| elem.match(title)}
        errors.add(:title, "must be clickbait")
      end
    end




end
