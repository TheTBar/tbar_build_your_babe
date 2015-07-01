module Spree
  Product.class_eval do
    def touch_taxons
      Spree::Taxon.where(id: taxon_and_ancestors.map(&:id)).update_all(updated_at: Time.current)
      # since all products in a package should have the same personality values, when any one of them is updated we can update the package taxon with the values
      Spree::Taxon.where(id: taxon_and_ancestors.map(&:id)).where(is_package_node: true).update_all(vixen_value: self.vixen_value, flirt_value: self.flirt_value, sophisticate_value: self.sophisticate_value, romantic_value: self.romantic_value)
      Spree::Taxonomy.where(id: taxonomy_ids).update_all(updated_at: Time.current)
    end
  end
end
