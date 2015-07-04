module Spree
  Product.class_eval do
    def touch_taxons
      Spree::Taxon.where(id: taxon_and_ancestors.map(&:id)).update_all(updated_at: Time.current)
      # since all products in a package should have the same personality values, when any one of them is updated we can update the package taxon with the values
      Spree::Taxon.where(id: taxon_and_ancestors.map(&:id)).where(is_package_node: true).update_all(vixen_value: self.vixen_value, flirt_value: self.flirt_value, sophisticate_value: self.sophisticate_value, romantic_value: self.romantic_value)
      Spree::Taxonomy.where(id: taxonomy_ids).update_all(updated_at: Time.current)
    end

    def does_product_have_stock_on_hand_for_option_value?(name)
      self.stock_items.each do |stock_item|
        if !stock_item.variant.is_master?
          if stock_item.variant.option_values.first.name == name
            return stock_item.count_on_hand > 0
          end
        end
      end
      false
    end

    def product_count_on_hand_hash_by_option_value_name
      count_hash_by_option_value_name = {}
      self.stock_items.each do |stock_item|
        if !stock_item.variant.is_master?
          count_hash_by_option_value_name[stock_item.variant.option_values.first.name] = stock_item.count_on_hand
        end
      end
      count_hash_by_option_value_name
    end

    def product_count_on_hand_hash_by_option_value_id
      count_hash_by_option_value_id = {}
      self.stock_items.each do |stock_item|
        if !stock_item.variant.is_master?
          count_hash_by_option_value_id[stock_item.variant.option_values.first.id] = stock_item.count_on_hand
        end
      end
      count_hash_by_option_value_id
    end

  end
end
