class RenameBabeTraitTypeIdOnBabeTriatValue < ActiveRecord::Migration
  def change
    rename_column :spree_babe_trait_values, :babe_trait_type_id, :spree_babe_trait_type_id
  end
end
