# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :movie_person, :class => 'MoviePeople' do
    student_id 1
    movie_id 1
  end
end
