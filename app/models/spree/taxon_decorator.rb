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

    # perhaps could use this to get all products and then see if the current product exists.  woudl be far less queries
      # if performance is bad the other way may have to invoke this.
    # Spree::Product.joins(:variants_including_master => :option_values)
    #   .where('spree_option_values.presentation = ? AND
    #       spree_option_values.option_type_id = ?', 'XL',
    #          Spree::OptionType.find_by_name('tshirt-size').id)

      available_taxons = []
      taxons = get_babes_package_list(babe)
      taxons.each do |taxon|
        taxon_is_available = true
        taxon.products.each do |product|
          if !product.does_product_have_stock_on_hand_for_option_value?(babe.size_value_for_size_option_type_name(product.product_size_type))
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
