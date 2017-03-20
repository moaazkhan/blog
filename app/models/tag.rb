class Tag
  include Mongoid::Document
  include Mongoid::Timestamps

  has_and_belongs_to_many :articles
  field :name, type: String
  field :slug, type: String
end
