module Spree
  HomeController.class_eval do
    def babes_items
      vixen_value = params['vixen_value_greater_than']
      @products = Product.where("spree_products.vixen_value > #{vixen_value}")
    end

    def my_babes_items
      @babe = Spree::Babe.find(params[:id])
      puts "we have the babe in home controller #{@babe.inspect}"
      vixen_value = @babe.vixen_value
      @products = Product.where("spree_products.vixen_value > #{vixen_value}")
    end

  end
end