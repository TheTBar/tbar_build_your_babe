class AddIsPackageNodeToTaxon < ActiveRecord::Migration
  def change
    add_column :spree_taxons, :is_package_node, :boolean, default: false
  end
end
