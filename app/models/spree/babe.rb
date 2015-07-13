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

    def bra_size
      "#{self.band}#{self.cup}".upcase
    end

    def size_value_for_size_option_type_name(size_type_name)
      if size_type_name.downcase == 'named sizes'
        return self.bottoms
      elsif size_type_name.downcase == 'bra sizes'
        return self.bra_size
      elsif size_type_name.downcase == 'number sizes'
        return self.number_size
      end
    end
  end
end
