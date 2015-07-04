require 'spec_helper'

describe Spree::Babe, :type => :model do

  let (:babe) { create(:babe, band: 36, cup: 'DD')}

  it "should return the band size" do
    expect(babe.bra_size).to eq '36DD'
  end

end
