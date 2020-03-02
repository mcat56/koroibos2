require 'rails_helper'

describe 'get top medalists' do
  it 'gets top male and female medalists' do
    team1 = Team.create(country: 'USA')
    team2 = Team.create(country: 'Germany')
    team3 = Team.create(country: 'Spain')
    sport1 = Sport.create(name: 'Rowing')
    game = Game.create(name: 'Summer 2016')

    olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 16, height: 168, weight: 58, team_id: team1.id, sport_id: sport1.id)
    olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 30, height: 170, weight: 60, team_id: team2.id, sport_id: sport1.id)
    olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 20, height: 174, weight: 62, team_id: team3.id, sport_id: sport1.id)

    olympian4 = Olympian.create(name: 'Mark', sex: 'M', age: 18, height: 172, weight: 68, team_id: team1.id, sport_id: sport1.id)
    olympian5 = Olympian.create(name: 'Michael', sex: 'M', age: 24, height: 178, weight: 72, team_id: team2.id, sport_id: sport1.id)
    olympian6 = Olympian.create(name: 'Matthew', sex: 'M', age: 32, height: 174, weight: 70, team_id: team3.id, sport_id: sport1.id)

    event1 = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport1.id )
    event2 = Event.create(name: 'Rowing Mens Lightweight Double Sculls', game_id: game.id, sport_id: sport1.id )

    event3 = Event.create(name: 'Rowing Womens Pair', game_id: game.id, sport_id: sport1.id )
    event4 = Event.create(name: 'Rowing Mens Pair', game_id: game.id, sport_id: sport1.id )

    event5 = Event.create(name: 'Rowing Womens Eight', game_id: game.id, sport_id: sport1.id )
    event6 = Event.create(name: 'Rowing Mens Eight', game_id: game.id, sport_id: sport1.id )

    olympian_event1 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event1.id, medal: 'Bronze' )
    olympian_event2 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event3.id, medal: 'Bronze' )
    olympian_event3 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event5.id, medal: 'Gold' )

    olympian_event4 = OlympianEvent.create(olympian_id: olympian4.id, event_id: event2.id, medal: 'Silver' )
    olympian_event5 = OlympianEvent.create(olympian_id: olympian4.id, event_id: event4.id, medal: 'Bronze' )
    olympian_event6 = OlympianEvent.create(olympian_id: olympian4.id, event_id: event6.id, medal: 'Gold' )

    olympian_event7 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event1.id, medal: 'Silver' )
    olympian_event8 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event3.id, medal: 'Gold' )

    olympian_event9 = OlympianEvent.create(olympian_id: olympian5.id, event_id: event2.id, medal: 'Bronze' )
    olympian_event10 = OlympianEvent.create(olympian_id: olympian5.id, event_id: event6.id, medal: 'Silver' )

    olympian_event11 = OlympianEvent.create(olympian_id: olympian3.id, event_id: event3.id, medal: 'Silver' )

    olympian_event12 = OlympianEvent.create(olympian_id: olympian6.id, event_id: event4.id, medal: 'Gold' )

    get '/api/v1/olympians/top_medalists'

    expect(response).to be_successful
    result = JSON.parse(response.body)
    expect(result["top_medalists"].length).to eq(2)

    expect(result["top_medalists"]["female"]["name"]).to eq('Sara')
    expect(result["top_medalists"]["male"]["name"]).to eq('Mark')

    expect(result["top_medalists"]["female"]["events"][0]["event"]).to eq('Rowing Womens Lightweight Double Sculls')
    expect(result["top_medalists"]["female"]["events"][1]["event"]).to eq('Rowing Womens Pair')
    expect(result["top_medalists"]["female"]["events"][2]["event"]).to eq('Rowing Womens Eight')
    expect(result["top_medalists"]["female"]["events"][0]["medal"]).to eq('Bronze')
    expect(result["top_medalists"]["female"]["events"][1]["medal"]).to eq('Bronze')
    expect(result["top_medalists"]["female"]["events"][2]["medal"]).to eq('Gold')
    expect(result["top_medalists"]["female"]["total_medals_won"]).to eq(3)

    expect(result["top_medalists"]["male"]["events"][0]["event"]).to eq('Rowing Mens Lightweight Double Sculls')
    expect(result["top_medalists"]["male"]["events"][1]["event"]).to eq('Rowing Mens Pair')
    expect(result["top_medalists"]["male"]["events"][2]["event"]).to eq('Rowing Mens Eight')
    expect(result["top_medalists"]["male"]["events"][0]["medal"]).to eq('Silver')
    expect(result["top_medalists"]["male"]["events"][1]["medal"]).to eq('Bronze')
    expect(result["top_medalists"]["male"]["events"][2]["medal"]).to eq('Gold')
    expect(result["top_medalists"]["male"]["total_medals_won"]).to eq(3)
  end
end
