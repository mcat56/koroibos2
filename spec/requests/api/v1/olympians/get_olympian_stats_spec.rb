require 'rails_helper'

describe 'get olympian stats' do
  it 'gets olympian stats for weight age and total count' do
    team1 = Team.create(country: 'USA')
    team2 = Team.create(country: 'Germany')
    team3 = Team.create(country: 'Spain')
    sport = Sport.create(name: 'Rowing')
    game = Game.create(name: 'Summer 2016')

    olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 16, height: 168, weight: 58, team_id: team1.id, sport_id: sport.id)
    olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 30, height: 170, weight: 60, team_id: team2.id, sport_id: sport.id)
    olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 20, height: 174, weight: 62, team_id: team3.id, sport_id: sport.id)

    olympian4 = Olympian.create(name: 'Mark', sex: 'M', age: 18, height: 172, weight: 68, team_id: team1.id, sport_id: sport.id)
    olympian5 = Olympian.create(name: 'Michael', sex: 'M', age: 24, height: 178, weight: 72, team_id: team2.id, sport_id: sport.id)
    olympian6 = Olympian.create(name: 'Matthew', sex: 'M', age: 32, height: 174, weight: 70, team_id: team3.id, sport_id: sport.id)

    get '/api/v1/olympian_stats'

    expect(response).to be_successful
    stats = JSON.parse(response.body)
    expect(stats["olympian_stats"]["total_competing_olympians"]).to eq(6)
    expect(stats["olympian_stats"]["average_weight"]["unit"]).to eq('kg')
    expect(stats["olympian_stats"]["average_weight"]["male_olympians"]).to eq(70.0)
    expect(stats["olympian_stats"]["average_weight"]["female_olympians"]).to eq(60.0)
    expect(stats["olympian_stats"]["average_age"]).to eq(23.3)
  end
end
