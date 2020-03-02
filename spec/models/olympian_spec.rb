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
end
