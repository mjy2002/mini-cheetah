FactoryBot.define do
  factory :shopping_list_item do
    shopping_list
    product
    quantity { 1 }
  end
end
