require 'rails_helper'

describe 'get all olympians' do
  it 'gets all olympians and associated info' do
    team1 = Team.create(country: 'USA')
    team2 = Team.create(country: 'Germany')
    team3 = Team.create(country: 'Spain')
    sport = Sport.create(name: 'Rowing')
    game = Game.create(name: 'Summer 2016')

    olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 27, height: 172, weight: 60, team_id: team1.id, sport_id: sport.id)
    olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 31, height: 172, weight: 60, team_id: team2.id, sport_id: sport.id)
    olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 28, height: 172, weight: 60, team_id: team3.id, sport_id: sport.id)

    event1 = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport.id )
    event2 = Event.create(name: 'Rowing Womens Lightweight Single Sculls', game_id: game.id, sport_id: sport.id )
    event3 = Event.create(name: 'Rowing Womens Double Sculls', game_id: game.id, sport_id: sport.id )

    olympian_event1 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event1.id, medal: 'Bronze' )
    olympian_event2 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event2.id, medal: 'Bronze' )
    olympian_event3 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event3.id, medal: 'Gold' )

    olympian_event4 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event1.id, medal: 'Gold' )
    olympian_event5 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event2.id, medal: 'Silver' )

    olympian_event6 = OlympianEvent.create(olympian_id: olympian3.id, event_id: event2.id, medal: 'Gold' )

    get '/api/v1/olympians'

    expect(response).to be_successful
    olympians = JSON.parse(response.body)
    require "pry"; binding.pry
    expect(olympians.olympians.length).to eq(5)
  end
end
