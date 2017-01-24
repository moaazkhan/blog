class Article
  include Mongoid::Document
  has_many    :comments
  # before_save :generate_slug_from_title

  #before validation is used so that before title is created else before_save won't give error.
  before_validation :generate_slug_from_title

  field :title,   type: String
  field :content, type: String
  #Initialize slug as string (Slug or parmalink is used instead of :id as route to give a proper name to the path)
  field :slug,    type: String

  validates :title,   presence: true
  validates :content, presence: true #validate presence can be used to avoid blanks in content, comment etc.
  validates :slug, uniqueness: true  #validate uniqueness is used to avoid user entry for duplication.

  # automatically generates slug from title before saving/creating article
  def generate_slug_from_title
    self.slug = self.title.downcase.gsub(' ','-')
  end

  def to_param
    self.slug
  end

end
