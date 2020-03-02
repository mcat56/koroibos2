require 'rails_helper'

describe OlympianEvent do
  describe 'validations' do
    it { should validate_presence_of :medal }
  end

  describe 'relationships' do
    it { should belong_to :olympian }
    it { should belong_to :event }
  end

  describe 'attributes' do
    it 'has attributes' do
      team1 = Team.create(country: 'USA')
      team2 = Team.create(country: 'Germany')
      team3 = Team.create(country: 'Spain')
      sport = Sport.create(name: 'Rowing')
      game = Game.create(name: 'Summer 2016')

      olympian1 = Olympian.create(name: 'Sara', sex: 'F', age: 30, height: 172, weight: 60, team_id: team1.id, sport_id: sport.id)
      olympian2 = Olympian.create(name: 'Solveig', sex: 'F', age: 30, height: 172, weight: 60, team_id: team2.id, sport_id: sport.id)
      olympian3 = Olympian.create(name: 'Susan', sex: 'F', age: 30, height: 172, weight: 60, team_id: team3.id, sport_id: sport.id)

      event = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport.id )
      olympian_event1 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event.id, medal: 'Bronze' )
      olympian_event2 = OlympianEvent.create(olympian_id: olympian2.id, event_id: event.id, medal: 'Silver' )
      olympian_event3 = OlympianEvent.create(olympian_id: olympian3.id, event_id: event.id, medal: 'Gold' )

      expect(olympian_event1.olympian).to eq(olympian1)
      expect(olympian_event2.olympian).to eq(olympian2)
      expect(olympian_event3.olympian).to eq(olympian3)
      expect(olympian_event1.event).to eq(event)
      expect(olympian_event2.event).to eq(event)
      expect(olympian_event3.event).to eq(event)
      expect(olympian_event1.medal).to eq('Bronze')
      expect(olympian_event2.medal).to eq('Silver')
      expect(olympian_event3.medal).to eq('Gold')
    end
  end
end
