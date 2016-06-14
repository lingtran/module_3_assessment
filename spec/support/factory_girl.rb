FactoryGirl.define do
  factory :items do
    name "name"
    description "description"
    image_url "image_url"
  end

  factory :order_items do
    order { Order.first || association(:order) }
    item { Item.first || association(:item) }
  end

  factory :orders do
    amount 1.0
    user { User.first || association(:user) }
  end

  factory :users do
    name "name"
    email "email@fake.com"
  end
end
