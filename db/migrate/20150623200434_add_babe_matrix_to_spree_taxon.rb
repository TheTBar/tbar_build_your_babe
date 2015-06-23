class AddBabeMatrixToSpreeTaxon < ActiveRecord::Migration
  def change
    add_column :spree_taxon, :vixen_value, :int
    add_column :spree_taxon, :romantic_value, :int
    add_column :spree_taxon, :flirt_value, :int
    add_column :spree_taxon, :sophisticate_value, :int
  end
end
