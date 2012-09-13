# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "someguy"
    sequence(:email){|n| "user#{n}@example.com" }
    password "somepass"
  end
end
