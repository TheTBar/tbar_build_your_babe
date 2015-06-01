module Spree
  class Babe < ActiveRecord::Base
    belongs_to :body_type

    def my_body_type
      self.body_type.name
    end

  end
end
