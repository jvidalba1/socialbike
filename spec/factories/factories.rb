FactoryGirl.define do

  factory :user do
    sequence(:name)  { |n| "Person #{n}" }
    sequence(:email) { |n| "person_#{n}@example.com"}
    password "foobar"
    password_confirmation "foobar"

    #factory :admin do
    #  admin true
    #end
  end

  factory :event do
    date "02/04/2013"
    description "Algun evento"
    estado 1
    name "Cerro"
    user
  end
end