# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :request do
    user nil
    group nil
    user_approved false
    group_approved false
    finalized false
    part "MyString"
  end
end
