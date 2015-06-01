class CreateSpreeBodyTypes < ActiveRecord::Migration
  def change
    create_table :spree_body_types do |t|
      t.string :name
      t.timestamps
    end
  end
end
