class Article
  include Mongoid::Document

  field :title,   type: String
  field :content, type: String

  validates :title,   presence: true
  validates :content, presence: true
end
