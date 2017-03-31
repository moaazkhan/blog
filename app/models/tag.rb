class Tag
  include Mongoid::Document
  include Mongoid::Timestamps
  include Sluggable

  has_and_belongs_to_many :articles
  before_validation :generate_slug_from_tag

  field :name, type: String
  field :slug, type: String


  def generate_slug_from_tag
    self.slug = self.name.downcase.gsub(' ','-')
  end


  def to_param
    self.slug
  end
end
