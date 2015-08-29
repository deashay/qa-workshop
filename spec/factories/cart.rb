FactoryGirl.define do
  factory :cart do
    association :user, factory: :user

    ignore do
      books_count 5
    end

    before(:create) do |cart, evaluator|
      evaluator.books_count.times do
        cart.books << create(:book)
      end
    end
  end
end
