module Spree
  class Babe < ActiveRecord::Base
    belongs_to :body_type

    def my_body_type
      self.body_type.name
    end

    def personality
      personality = Hash.new
      personality['vixen_value'] = self.vixen_value
      personality['flirt_value'] = self.flirt_value
      personality['sophisticate_value'] = self.sophisticate_value
      personality['romantic_value'] = self.romantic_value
      personality.sort_by {|_key, value| value}.reverse.first 2
    end

  end
end
