class AddActiveFlagToSpreeBabeTraitValues < ActiveRecord::Migration
  def change
    add_column :spree_babe_trait_values, :active, :boolean, default: true
  end
end
