FactoryBot.define do
  sequence(:first_name) { |n| "John#{n}" }
  sequence(:last_name) { |n| "Doe#{n}" }

  factory :player do
    first_name
    last_name
    team
  end
end
