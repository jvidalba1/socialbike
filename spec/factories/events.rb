# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :event do
    name "MyString"
    description "MyString"
    date "MyString"
    estado 1
    user_id 4
  end
end
