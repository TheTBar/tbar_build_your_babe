class CreateSpreeBabeTraitTypes < ActiveRecord::Migration
  def change
    create_table :spree_babe_trait_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
