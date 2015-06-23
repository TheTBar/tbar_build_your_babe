class AddBabeMatrixToSpreeTaxon < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :vixen_value, :int
    add_column :spree_taxons, :romantic_value, :int
    add_column :spree_taxons, :flirt_value, :int
    add_column :spree_taxons, :sophisticate_value, :int
  end
end
