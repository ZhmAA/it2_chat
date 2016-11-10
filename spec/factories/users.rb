FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "name#{n}@name.com"
    end
    password "123456"
    password_confirmation { password }
  end
end