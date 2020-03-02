require 'rails_helper'

describe Event do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should belong_to :sport }
    it { should belong_to :game }
    it { should have_many :olympian_events }
    it { should have_many(:olympians).through(:olympian_events)}
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

      expect(event.name).to eq('Rowing Womens Lightweight Double Sculls')
      expect(event.sport).to eq(sport)
      expect(event.game).to eq(game)
    end
  end
end
