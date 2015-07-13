module Spree
  TaxonsController.class_eval do

    def my_babes_package_list
      @babe = Spree::Babe.find(params[:id])
      #set babe_id on session
      session[:babe_id] = @babe.id
      @taxons = Taxon.get_babes_package_list(@babe)
      return unless @taxons
    end

  end
end
