require 'rails_helper'

describe Sport do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :olympians }
    it { should have_many :events }
  end

  describe 'attributes' do
    it 'has attributes' do
      sport = Sport.create(name: 'Rowing')

      expect(sport.name).to eq('Rowing')
    end
  end
end
