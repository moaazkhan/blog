class Comment
  include Mongoid::Document
  belongs_to :article

  field :content, type: String

  validates :content, presence: true
end
