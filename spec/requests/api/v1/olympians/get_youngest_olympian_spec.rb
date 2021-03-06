require 'rails_helper'

describe 'get youngest olympian' do
  it 'gets youngest olympian and associated info' do
    team1 = Team.create(country: 'USA')
    team2 = Team.create(country: 'Germany')
    team3 = Team.create(country: 'Spain')
    sport = Sport.create(name: 'Rowing')
    game = Game.create(name: 'Summer 2016')

    olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 13, height: 172, weight: 60, team_id: team1.id, sport_id: sport.id)
    olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 21, height: 172, weight: 60, team_id: team2.id, sport_id: sport.id)
    olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 11, height: 172, weight: 60, team_id: team3.id, sport_id: sport.id)

    get '/api/v1/olympians?age=youngest'

    expect(response).to be_successful
    olympians = JSON.parse(response.body)
    expect(olympians["olympians"].length).to eq(1)
    expect(olympians["olympians"][0]["name"]).to eq('Susan')
  end
end
