class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction)}
    # validate :is_sufficiently_clickbaity?

    # @@clickbait_array = ["Won't Believe", "Secret", "Top [number]", "Guess"]

    # def is_sufficiently_clickbaity?
    #    clickbait = @@clickbait_array.select do |clickbait|
    #     clickbait ==  title
    #    end
    #    if clickbait.empty?
    #        errors.add(:title, "must be more clickbaity")
    #        return false
    #     end 
    # end

      validate :is_clickbait?

  CLICKBAIT_PATTERNS = [
    /Won't Believe/i,
    /Secret/i,
    /Top [0-9]*/i,
    /Guess/i
  ]

  def is_clickbait?
    if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
      errors.add(:title, "must be clickbait")
    end
  end
end
