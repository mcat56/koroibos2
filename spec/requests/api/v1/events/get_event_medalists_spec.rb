require 'rails_helper'

describe 'get event medalists' do
  it 'gets the medalists for one event' do
    team1 = Team.create(country: 'USA')
    team2 = Team.create(country: 'Germany')
    team3 = Team.create(country: 'Spain')
    sport = Sport.create(name: 'Rowing')
    game = Game.create(name: 'Summer 2016')

    olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 27, height: 172, weight: 60, team_id: team1.id, sport_id: sport.id)
    olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 31, height: 172, weight: 60, team_id: team2.id, sport_id: sport.id)
    olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 28, height: 172, weight: 60, team_id: team3.id, sport_id: sport.id)

    event1 = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport.id )

    olympian_event1 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event1.id, medal: 'Bronze' )
    olympian_event2 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event1.id, medal: 'Silver' )
    olympian_event3 = OlympianEvent.create(olympian_id: olympian3.id, event_id: event1.id, medal: 'Gold' )

    get "/api/v1/events/#{event1.id}/medalists"

    expect(response).to be_successful
    medalists = JSON.parse(response.body)
    expect(medalists["event"]).to eq('Rowing Womens Lightweight Double Sculls')
    expect(medalists["medalists"][0]["name"]).to eq('Susan')
    expect(medalists["medalists"][1]["name"]).to eq('Solveig')
    expect(medalists["medalists"][0]["medal"]).to eq('Gold')
    expect(medalists["medalists"][1]["medal"]).to eq('Silver')
  end
end
