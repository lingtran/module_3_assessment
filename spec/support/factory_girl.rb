FactoryGirl.define do
  factory :item do
    sequence(:name) {|n| "name#{n}"}
    description "description"
    image_url "image_url"
  end

  factory :order_item do
    order { Order.first || association(:order) }
    item { Item.first || association(:item) }
  end

  factory :order do
    amount 1.0
    user { User.first || association(:user) }
  end

  factory :user do
    name "name"
    email "email@fake.com"
  end
end
