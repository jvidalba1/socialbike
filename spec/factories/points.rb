# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :point do
    Tracksegment nil
    name "MyString"
    latitude 1.5
    longitude 1.5
    elevation 1.5
    description "MyString"
    point_created_at "2013-06-04 19:56:03"
  end
end
