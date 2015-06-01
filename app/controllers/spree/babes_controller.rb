module Spree
  class BabesController < Spree::StoreController

    def index

    end

    def new
      @babe = Babe.new
      puts "we have the new babe: #{@babe.inspect}"
    end

    def create
      @babe = Spree::Babe.new(babe_params)
      respond_to do |format|
        if @babe.save
          puts "the babe was saved! id: #{@babe.id}"
          format.html {redirect_to her_items_path(@babe)}
        else
          format.html { render :new }
        end
      end
    end



    private

    def babe_params
      params.require(:babe).permit(:user_id, :body_type_id, :name, :height, :band, :cup, :bottoms, :vixen_value, :romantic_value, :flirt_value, :sophisticate_value)
    end


  end
end