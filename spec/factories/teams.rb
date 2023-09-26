FactoryBot.define do
  factory :team, aliases: %i[home_team away_team] do
    name { 'Real' }
  end
end
