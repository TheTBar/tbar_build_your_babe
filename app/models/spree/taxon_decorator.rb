module Spree
  Taxon.class_eval do

    def self.get_babes_package_list(babe)
      personality = babe.personality
      # puts personality[0][0]
      # puts personality[0][1]
      #personality.each {|name,value| puts "#{name} = #{value}" }

      Spree::Taxon.where(is_package_node: true).where(personality[0][0] => personality[0][1]).order("#{personality[0][0]} DESC, #{personality[1][0]} DESC")
    end

    def self.get_babes_available_package_list(babe)
      available_taxons = []
      taxons = get_babes_package_list(babe)
      taxons.each do |taxon|
        taxon_is_available = true
        taxon.products.each do |product|
          if product.does_product_have_stock_on_hand_for_option_value?(babe.bottoms)

          elsif product.does_product_have_stock_on_hand_for_option_value?(babe.bra_size)

          else
            taxon_is_available = false
          end
        end
        if taxon_is_available
          available_taxons.push(taxon)
        end
      end
      available_taxons
    end
  end

end
