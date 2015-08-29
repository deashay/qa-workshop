FactoryGirl.define do
  factory :book do
    author { FFaker::Name.name }
    publishing_house { FFaker::Company.name }
    published_at { 10.years.ago }
    quantity 1

    ignore do
      book_category_name nil
    end

    before(:create) do |book, evaluator|
      if evaluator.book_category_name
        book.book_category = create :book_category, name: evaluator.book_category_name
      else
        book.book_category = create :book_category
      end
    end
  end
end
