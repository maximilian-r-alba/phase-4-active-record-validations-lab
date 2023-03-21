class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, acceptance: { accept: ["Fiction" , "Non-Fiction"] , message: "is not included in the list"}
    validate :clickbait?

    CLICKBAIT_WORDS = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d/i,
        /Guess/i
      ]

    def clickbait?
        if CLICKBAIT_WORDS.none? {|word| word.match title}
            errors.add(:title, "must be clickbait")
        end
    end
end
