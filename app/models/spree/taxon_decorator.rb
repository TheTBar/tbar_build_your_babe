module Spree
  Taxon.class_eval do

    def self.get_babes_package_list(babe)
      personality = babe.personality
      # puts personality[0][0]
      # puts personality[0][1]
      #personality.each {|name,value| puts "#{name} = #{value}" }

      Spree::Taxon.where(is_package_node: true).where(personality[0][0] => personality[0][1]).order("#{personality[0][0]} DESC, #{personality[1][0]} DESC")
    end

  end

end
