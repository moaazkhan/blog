module Sluggable
  extend ActiveSupport::Concern

  included do
    def hello!
      "Hello how are you?"
    end
  end
end
