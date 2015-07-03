FactoryGirl.define do
  # Define your Spree extensions Factories within this file to enable applications, and other extensions to use and override them.
  #
  # Example adding this to your spec_helper will load these Factories for use:
  # require 'spree_build_your_babe/factories'


  factory :babe, :class => 'Spree::Babe' do
    name "my babe"
    body_type_id 1
    height 67
    band 34
    cup 'B'
    bottoms 'M'
    vixen_value 5
    flirt_value 4
    sophisticate_value 3
    romantic_value 2
  end

end
