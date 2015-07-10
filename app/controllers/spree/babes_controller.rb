module Spree
  class BabesController < Spree::StoreController

    def index
      @babes = Babe.where("spree_user_id = #{spree_current_user.id}")
    end

    def access_concierge
      if (spree_current_user && spree_current_user.has_babes?)
        redirect_to babes_path
      else
        redirect_to new_babe_path
      end
    end

    def new
      @babe = Babe.new
    end

    def create
      @babe = Spree::Babe.new(babe_params)
      respond_to do |format|
        if @babe.save
          format.html {redirect_to my_babes_package_list_path(@babe)}
        else
          format.html { render :new }
        end
      end
    end



    private

    def babe_params
      params.require(:babe).permit(:user_id, :body_type_id, :name, :height, :band, :cup, :bottoms, :number_size, :vixen_value, :romantic_value, :flirt_value, :sophisticate_value)
    end


  end
end