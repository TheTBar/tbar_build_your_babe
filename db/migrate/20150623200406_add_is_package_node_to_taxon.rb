class AddIsPackageNodeToTaxon < ActiveRecord::Migration
  def change
    add_column :spree_taxon, :is_package_node, :boolean, default: false
  end
end
