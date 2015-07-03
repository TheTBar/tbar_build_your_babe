module Spree
  TaxonsController.class_eval do

    def my_babes_package_list
      #SELECT distinct a.*,c.vixen_value,c.flirt_value,c.romantic_value FROM spree_taxons a JOIN spree_products_taxons b ON a.id = b.taxon_id JOIN spree_products c ON b.product_id = c.id WHERE c.vixen_value = 5 AND a.is_package_node = true ORDER BY c.vixen_value,c.romantic_value DESC;
      babe = Spree::Babe.find(params[:id])
      Rails.logger.debug "we have the babe: #{babe.inspect  }"
      #@taxons = Taxon.friendly.where(is_package_node: true)
      #@taxons = Taxon.find_by_sql("SELECT distinct a.*,c.vixen_value,c.flirt_value,c.romantic_value FROM spree_taxons a JOIN spree_products_taxons b ON a.id = b.taxon_id JOIN spree_products c ON b.product_id = c.id WHERE c.vixen_value = 5 AND a.is_package_node = true ORDER BY c.vixen_value,c.romantic_value DESC")
      @taxons = Taxon.get_babes_package_list(babe)
      Rails.logger.debug "we have the packages and there are #{@taxons.count} of them"
      return unless @taxons
    end

  end
end
