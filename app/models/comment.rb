class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  belongs_to :article
  belongs_to :user

  field :content, type: String

  validates :content, presence: true
end
