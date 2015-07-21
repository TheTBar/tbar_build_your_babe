class AddDefaultOfZeroToBabeTraitPersonalityValues < ActiveRecord::Migration
  def change
    change_column :spree_babe_trait_values, :vixen_value, :int, default: 0
    change_column :spree_babe_trait_values, :flirt_value, :int, default: 0
    change_column :spree_babe_trait_values, :romantic_value, :int, default: 0
    change_column :spree_babe_trait_values, :sophisticate_value, :int, default: 0
  end
end
