require 'rails_helper'

describe Olympian do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :sex }
    it { should validate_presence_of :age }
    it { should validate_presence_of :height }
    it { should validate_presence_of :weight }
  end

  describe 'relationships' do
    it { should belong_to :team }
    it { should belong_to :sport }
    it { should have_many :olympian_events }
    it { should have_many(:events).through(:olympian_events)}
  end

  describe 'attributes' do
    it 'has attributes' do
      team = Team.create(country: 'USA')
      sport = Sport.create(name: 'DJ')
      olympian = Olympian.create(name: 'Sonny', sex: 'M', age: 30, height: 172, weight: 70, team_id: team.id, sport_id: sport.id)

      expect(olympian.name).to eq('Sonny')
      expect(olympian.sex).to eq('M')
      expect(olympian.age).to eq(30)
      expect(olympian.height).to eq(172)
      expect(olympian.weight).to eq(70)
      expect(olympian.team).to eq(team)
      expect(olympian.sport).to eq(sport)
    end
  end

  describe 'methods' do
    it 'total_medals' do
      game = Game.create(name: '2016 Summer')
      team = Team.create(country: 'USA')
      sport = Sport.create(name: 'Rowing')
      olympian1 = Olympian.create(name: 'Sonny', sex: 'M', age: 30, height: 172, weight: 70, team_id: team.id, sport_id: sport.id)
      event1 = Event.create(name: 'Rowing Womens Lightweight Double Sculls', game_id: game.id, sport_id: sport.id )
      event2 = Event.create(name: 'Rowing Womens Lightweight Single Sculls', game_id: game.id, sport_id: sport.id )
      event3 = Event.create(name: 'Rowing Womens Double Sculls', game_id: game.id, sport_id: sport.id )
      event4 = Event.create(name: 'Rowing Mens Double Sculls', game_id: game.id, sport_id: sport.id )
      event5 = Event.create(name: 'Rowing Mens Single Sculls', game_id: game.id, sport_id: sport.id )

      olympian_event1 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event1.id, medal: 'Bronze' )
      olympian_event2 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event2.id, medal: 'Bronze' )
      olympian_event3 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event3.id, medal: 'Gold' )
      olympian_event4 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event4.id, medal: 'NA' )
      olympian_event5 = OlympianEvent.create(olympian_id: olympian1.id, event_id: event5.id, medal: 'NA' )

      expect(olympian1.total_medals).to eq(3)
    end
  end
end
