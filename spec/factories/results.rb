FactoryBot.define do
  sequence(:body) { |n| "пробежал #{n}+ км" }

  factory :result do
    body
  end
end
