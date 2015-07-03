require 'spec_helper'

describe Spree::Taxon, :type => :model do

  let(:sets_taxon) { create(:taxon, name: 'sets')}

  context "There are packages" do

    before { create(:taxon, name: 'package1', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1) }
    before { create(:taxon, name: 'package1b', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 5, flirt_value: 3, sophisticate_value: 1, romantic_value:2) }
    before { create(:taxon, name: 'package2', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 4, flirt_value: 5, sophisticate_value: 3, romantic_value:2) }
    before { create(:taxon, name: 'package2b', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 3, flirt_value: 5, sophisticate_value: 3, romantic_value:2) }
    before { create(:taxon, name: 'package2c', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 2, flirt_value: 5, sophisticate_value: 3, romantic_value:2) }
    before { create(:taxon, name: 'package3', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 3, flirt_value: 4, sophisticate_value: 5, romantic_value:2) }
    before { create(:taxon, name: 'package3b', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 3, flirt_value: 3, sophisticate_value: 5, romantic_value:2) }
    before { create(:taxon, name: 'package3c', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id, vixen_value: 3, flirt_value: 1, sophisticate_value: 5, romantic_value:2) }

    it "should return all the packages" do
      expect(Spree::Taxon.friendly.where(is_package_node: true).count).to eq 8
    end

    it "should return all the packages 1's" do
      my_babe = create(:babe, name: 'my babe 1', vixen_value: 5, flirt_value: 2, sophisticate_value: 3, romantic_value:1)
      @taxons = Spree::Taxon.get_babes_package_list(my_babe)
      expect(@taxons.count).to eq 2
      expect(@taxons[0].name).to eq 'package1'
      expect(@taxons[1].name).to eq 'package1b'
    end

    it "should return all the packages 1's reverse ordered" do
      my_babe = create(:babe, name: 'my babe 1', vixen_value: 5, flirt_value: 2, sophisticate_value: 3, romantic_value:4)
      @taxons = Spree::Taxon.get_babes_package_list(my_babe)
      expect(@taxons.count).to eq 2
      expect(@taxons[0].name).to eq 'package1b'
      expect(@taxons[1].name).to eq 'package1'
    end

    it "should return all the package 2's" do
      my_babe = create(:babe, name: 'my babe 1', vixen_value: 2, flirt_value: 5, sophisticate_value: 1, romantic_value:1)
      @taxons = Spree::Taxon.get_babes_package_list(my_babe)
      expect(@taxons.count).to eq 3
      expect(@taxons[0].name).to eq 'package2'
      expect(@taxons[1].name).to eq 'package2b'
      expect(@taxons[2].name).to eq 'package2c'
    end

  end

  context "packages with products" do
    let(:taxon1) { create(:taxon, name: 'package1', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id ) }
    let(:taxon2) { create(:taxon, name: 'package2', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id ) }
    let(:taxon3) { create(:taxon, name: 'package3', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id ) }
    let(:taxon4) { create(:taxon, name: 'package4', is_package_node: true, taxonomy_id: sets_taxon.taxonomy_id, parent_id: sets_taxon.id ) }


    def build_option_type_with_values(name, values)
      ot = create(:option_type, :name => name)
      values.each do |val|
        ot.option_values.create(:name => val.downcase, :presentation => val)
      end
      ot
    end

    def build_options_values_hash_from_option_type(option_type,hash)
      hash[option_type.id.to_s] = option_type.option_value_ids
    end

    let(:bottom_option_type) do
      build_option_type_with_values("bottom sizes", %w(Small Medium Large))
    end

    let(:bra_option_type) do
      build_option_type_with_values("bra sizes", %w(34A 34B 34C 36A 36B 36C))
    end

    let(:number_size_option_type) do
      build_option_type_with_values("number sizes", %w(1 2 3 4))
    end

    let(:product1) { create(:product, name: 'product1', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bra_option_type.id.to_s => bra_option_type.option_value_ids}, taxons: [taxon1]) }
    let(:product1b) { create(:product, name: 'product1b', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bottom_option_type.id.to_s => bottom_option_type.option_value_ids}, taxons: [taxon1]) }
    let(:product2) { create(:product, name: 'product2', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bra_option_type.id.to_s => bra_option_type.option_value_ids}, taxons: [taxon2]) }
    let(:product2b) { create(:product, name: 'product2b', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bottom_option_type.id.to_s => bottom_option_type.option_value_ids}, taxons: [taxon2]) }
    let(:product3) { create(:product, name: 'product3', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bra_option_type.id.to_s => bra_option_type.option_value_ids}, taxons: [taxon3]) }
    let(:product3b) { create(:product, name: 'product3b', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {bottom_option_type.id.to_s => bottom_option_type.option_value_ids}, taxons: [taxon3]) }
    let(:product4) { create(:product, name: 'product4', vixen_value: 5, flirt_value: 4, sophisticate_value: 3, romantic_value:1, option_values_hash: {number_size_option_type.id.to_s => number_size_option_type.option_value_ids}, taxons: [taxon4]) }

    it "should have created variants and sets" do
      expect(product1.variants.length).to eq(6)
      expect(product1b.variants.length).to eq(3)
      expect(product4.variants.length).to eq(4)

      expect(taxon1.products.count).to eq 2
      expect(taxon4.products.count).to eq 1
    end

  end


end
