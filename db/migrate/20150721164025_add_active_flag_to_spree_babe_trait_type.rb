class AddActiveFlagToSpreeBabeTraitType < ActiveRecord::Migration
  def change
    add_column :spree_babe_trait_types, :active, :boolean, default: true
  end
end
