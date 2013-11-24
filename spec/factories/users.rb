# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "bobsmith99"
    email "bob@discover.net"
    fname "Bob"
    lname "Smith"
    password "123456"
    password_confirmation "123456"
  end
end
