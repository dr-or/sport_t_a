TEAMS = ['Manchester United', 'Real Madrid']
PLAYER_COUNT = 3
MATCH_COUNT = 3

PLAYERS = [
  { first_name: 'Robert', last_name: 'Lewandowski' },
  { first_name: 'Lionel', last_name: 'Messi' },
  { first_name: 'Mohamed', last_name: 'Salah' },
  { first_name: 'Karim', last_name: 'Benzema' },
  { first_name: 'Kylian', last_name: 'Mbappé' },
  { first_name: 'Erling', last_name: 'Haaland' }
]

ACHIEVEMENTS = [
  'сделал 70+ % точных передач',
  'пробежал 10+ км'
]

TEAMS.each_with_index do |team, index|
  new_team = Team.create(name: team)

  first = index * PLAYER_COUNT
  last = first + PLAYER_COUNT - 1

  PLAYERS[first..last].each do |player|
    new_team.players.create(first_name: player[:first_name], last_name: player[:last_name])
  end
end

teams = Team.all

MATCH_COUNT.times do |i|
  shuffled_teams = teams.shuffle
  date = Time.now - i.days - i.hours

  Match.create(
    match_date: date,
    home_team_id: shuffled_teams.first.id,
    away_team_id: shuffled_teams.last.id
  )
end

players = Player.all
matches = Match.all

ACHIEVEMENTS.each do |achievement|
  new_achievement = Achievement.create(body: achievement)

  players.each do |player|
    next if rand(0..2) == 0
    new_achievement.reach_by(player, matches.sample)
  end
end
