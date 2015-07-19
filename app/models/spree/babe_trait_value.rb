module Spree
  class BabeTraitValue < ActiveRecord::Base
    belongs_to :spree_babe_trait_type, :class_name => 'Spree::BabeTraitType'
    validates_presence_of :name
  end
end