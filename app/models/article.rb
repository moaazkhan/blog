class Article
  include Mongoid::Document
  include Mongoid::Timestamps
  has_many    :comments
  belongs_to  :user
  # before_save :generate_slug_from_title

  #before validation is used so that before title is created else before_save won't give error.
  before_validation :generate_slug_from_title
#
#   class Holiday < ApplicationRecord
#   validates :name, uniqueness: { scope: :year,
#     message: "should happen once per year" }
# end


  field :title,   type: String
  field :content, type: String
  #Initialize slug as string (Slug or parmalink is used instead of :id as route to give a proper name to the path)
  field :slug,          type: String
  # field :articleuser    type:String
  validates :title,     presence: true
  validates :content,   presence: true #validate presence can be used to avoid blanks in content, comment etc.
  validates :slug,      presence: true, uniqueness: {scope: :user} #validate uniqueness is used to avoid user entry for duplication.

  # automatically generates slug from title before saving/creating article
  def generate_slug_from_title
    self.slug = self.title.downcase.gsub(' ','-')
  end

  def to_param
    self.slug
  end

  # def user_name_uniq
  #   self.user_name
  # end

end
