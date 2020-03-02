require 'rails_helper'

describe 'get all olympians' do
  it 'gets all olympians and associated info' do
    game = Game.create(name: 'Summer 2016')
    sport1 = Sport.create(name: 'Rowing')
    sport2 = Sport.create(name: 'Archery')
    sport3 = Sport.create(name: 'Badminton')

    event1 = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport1.id )
    event2 = Event.create(name: 'Rowing Womens Lightweight Single Sculls', game_id: game.id, sport_id: sport1.id )
    event3 = Event.create(name: 'Rowing Womens Double Sculls', game_id: game.id, sport_id: sport1.id )

    event4 = Event.create(name: "Archery Men's Individual", game_id: game.id, sport_id: sport2.id )
    event5 = Event.create(name: "Archery Men's Team", game_id: game.id, sport_id: sport2.id )
    event6 = Event.create(name:  "Archery Women's Individual", game_id: game.id, sport_id: sport2.id )

    event7 = Event.create(name: "Badminton Women's Doubles", game_id: game.id, sport_id: sport3.id )
    event8 = Event.create(name: "Badminton Women's Singles", game_id: game.id, sport_id: sport3.id )
    event9 = Event.create(name:  "Badminton Mixed Doubles", game_id: game.id, sport_id: sport3.id )

    get '/api/v1/events'

    expect(response).to be_successful
    events = JSON.parse(response.body)
    expect(events["events"].length).to eq(3)
    expect(events["events"][0]["sport"]).to eq('Rowing')
    expect(events["events"][1]["sport"]).to eq('Archery')
    expect(events["events"][2]["sport"]).to eq('Badminton')

    expect(events["events"][0]["events"].length).to eq(3)
    expect(events["events"][1]["events"].length).to eq(3)
    expect(events["events"][2]["events"].length).to eq(3)

    expect(events["events"][0]["events"][0]).to eq('Rowing Womens Lightweight Double Sculls')
    expect(events["events"][0]["events"][1]).to eq('Rowing Womens Lightweight Single Sculls')
    expect(events["events"][0]["events"][2]).to eq('Rowing Womens Double Sculls')

    expect(events["events"][1]["events"][0]).to eq("Archery Men's Individual")
    expect(events["events"][1]["events"][1]).to eq("Archery Men's Team")
    expect(events["events"][1]["events"][2]).to eq( "Archery Women's Individual")

    expect(events["events"][2]["events"][0]).to eq("Badminton Women's Doubles")
    expect(events["events"][2]["events"][1]).to eq("Badminton Women's Singles")
    expect(events["events"][2]["events"][2]).to eq("Badminton Mixed Doubles")
  end
end
