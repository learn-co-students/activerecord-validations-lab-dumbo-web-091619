class TitleValidator < ActiveModel::Validator
  def validate(record)
    return if record.title.nil?
    if record.title.include?("Won't Believe") ||
      record.title.include?("Secret") || 
      record.title.include?("Top ") ||
      record.title.include?("Guess")

     return
   end
    record.errors[:title] = "Not clicky enough"
  end
end