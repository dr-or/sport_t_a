FactoryBot.define do
  factory :player do
    first_name { "John" }
    last_name { "Doe" }
    team
  end
end
