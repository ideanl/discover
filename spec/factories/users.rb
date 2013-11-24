# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    username "bobsmith99"
    email "bob@discover.net"
    fname "Bob"
    lname "Smith"
  end
end
