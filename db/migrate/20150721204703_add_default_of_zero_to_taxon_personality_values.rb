class AddDefaultOfZeroToTaxonPersonalityValues < ActiveRecord::Migration
  def change
    change_column :spree_taxons, :vixen_value, :int, default: 0
    change_column :spree_taxons, :flirt_value, :int, default: 0
    change_column :spree_taxons, :romantic_value, :int, default: 0
    change_column :spree_taxons, :sophisticate_value, :int, default: 0
  end
end
