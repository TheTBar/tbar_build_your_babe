require 'spec_helper'
include Warden::Test::Helpers
Warden.test_mode!


describe "babes link", type: :feature do

  context "guest is exploring site" do
    it "should allow a guest to build a babe" do
      visit "/"
      click_link "Build Your Babe"
      expect(current_path).to eql(spree.new_babe_path)
      fill_in_babe
      click_button "Show me the goods"
      expect(current_path).to eql(spree.my_babes_package_list_path(1))
      expect(page).to have_content("Our personalized selection for Stella")
    end
  end

  
  context "user logs in" do
    let(:user) {FactoryGirl.create(:user)}

    before (:each) do
      login_as(user, scope: :spree_user)
    end

    it "should allow the user to load the build a babe page" do
      visit spree.build_your_babe_path
      expect(page).to have_content('Body Type')
    end

    it "should allow the user to save a babe" do
      visit spree.build_your_babe_path
      fill_in_babe
      click_button "Show me the goods"
      expect(current_path).to eql(spree.my_babes_package_list_path(1))
      expect(page).to have_content("Our personalized selection for Stella")
    end

    context "user has at least one babe already" do

      let!(:babe1) { create(:babe, name: 'babe1', band: 36, cup: 'DD', bottoms: 'medium', number_size: '3', spree_user_id: user.id)}
      let!(:babe2) { create(:babe, name: 'babe2', band: 36, cup: 'DD', bottoms: 'medium', number_size: '3', spree_user_id: user.id)}

      it "should show a list of the babes" do
        visit spree.babes_path
        expect(page).to have_content('Your Babes')
        expect(page).to have_content('babe1')
        expect(page).to have_content('babe2')
        expect(page).to have_content('Build A New Babe')
      end


      it "should show the babe list page on clicking the build a babe link" do
        visit "/"
        click_link "Build Your Babe"
        expect(current_path).to eql(spree.babes_path)
      end



    end

  end

  def fill_in_babe
    fill_in "babe_name", :with => "Stella"
    fill_in "babe_height", :with => "65"
    fill_in "babe_band", :with => "34"
    fill_in "babe_cup", :with => "D"
    fill_in "babe_bottoms", :with => "Medium"
    fill_in "babe_number_size", :with => "3"
    fill_in "babe_vixen_value", :with => "5"
    fill_in "babe_romantic_value", :with => "4"
    fill_in "babe_flirt_value", :with => "3"
    fill_in "babe_sophisticate_value", :with => "2"

  end

end
