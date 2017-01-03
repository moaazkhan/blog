class Article
  include Mongoid::Document

  has_many :comments

  field :title,   type: String
  field :content, type: String

  validates :title,   presence: true
  validates :content, presence: true
end
