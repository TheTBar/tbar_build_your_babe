module Spree
  TaxonsController.class_eval do

    def my_babes_package_list
      @babe = Spree::Babe.find(params[:id])
      #Rails.logger.debug "we have the babe: #{@babe.inspect}"
      #set babe_id on session
      session[:babe_id] = @babe.id
      @taxons = Taxon.get_babes_package_list(@babe)
      #Rails.logger.debug "we have the packages and there are #{@taxons.count} of them"
      return unless @taxons
    end

  end
end
