class Chirp < ActiveRecord::Base
  belongs_to :user
  validates :user_id, :content, presence: true
  validates_length_of :content, maximum: 140, allow_blank: true

  before_save :parse_content

  def parse_content
    unparsed = self.content.split(' ')
    unparsed.collect! do |word|
      if word[0] == '@'
        name = word.sub('@', '')
        tagged_user = User.find_by_username(name)
        unless tagged_user.nil?
          word = "<a class='tag-link' href='/users/#{tagged_user.id}'>@#{tagged_user.username}</a>"
        else
          word
        end
      else
        word
      end
    end
    parsed = unparsed.join(' ')
    self.content = parsed
  end
end
