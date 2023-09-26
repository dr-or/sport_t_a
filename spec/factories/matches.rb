FactoryBot.define do
  factory :match do
    match_date { Time.now }
    home_team
    away_team
  end
end
