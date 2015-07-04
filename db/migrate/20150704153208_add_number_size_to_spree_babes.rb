class AddNumberSizeToSpreeBabes < ActiveRecord::Migration
  def change
    add_column :spree_babes, :number_size, :string
  end
end
