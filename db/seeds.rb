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

RESULTS = [
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

RESULTS.each do |result|
  new_result = Result.create(body: result)

  shuffled_players = players.shuffle
  result_count = PLAYERS.count * MATCH_COUNT

  result_count.times do |i|
    next if rand(0..2) == 0
    player_index = i % PLAYERS.count
    match_index = i / PLAYERS.count
    new_result.achieved_by(shuffled_players[player_index], matches[match_index])
  end
end
