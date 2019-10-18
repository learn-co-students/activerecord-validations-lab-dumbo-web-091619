class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates_inclusion_of :category, :in => %w(Fiction Non-Fiction)
    validate :title_is_clickbait?



    @@clickbait = ["Won't Believe", "Secret", "Top", "Guess"]

    def title_is_clickbait?
        if title && @@clickbait.any? {|bait| title.include?(bait)}  
    else
        errors.add(:title, "Title must include clickbait")
        end
    end
end
