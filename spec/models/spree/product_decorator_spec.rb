require 'spec_helper'

describe Spree::Product, :type => :model do

  context "Product Becomes Part Of Package" do

    let(:taxonomy) { create(:taxonomy, name: 'sets')}
    let(:taxon) { create(:taxon, name: 'first package', is_package_node: true, parent_id: 1)}

    it "should set the personality values of its parent taxon package" do
      product = create(:product)

      product.taxons << taxon
      product.vixen_value = 5;
      product.flirt_value = 4;
      product.sophisticate_value = 3;
      product.romantic_value = 2;
      product.save

      taxon_after = Spree::Taxon.last
      expect(taxon_after.vixen_value).to eq(5)
      expect(taxon_after.flirt_value).to eq(4)
      expect(taxon_after.sophisticate_value).to eq(3)
      expect(taxon_after.romantic_value).to eq(2)

      parent_taxon = Spree::Taxon.find(taxon_after.parent_id)
      expect(parent_taxon.vixen_value).to eq nil

    end






  end






end
