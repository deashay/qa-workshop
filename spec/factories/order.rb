FactoryGirl.define do
  factory :order do
    association :user, factory: :user
    association :cart, factory: :cart
  end
end
