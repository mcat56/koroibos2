require 'rails_helper'

describe Team do
  describe 'validations' do
    it { should validate_presence_of :country }
  end

  describe 'relationships' do
    it { should have_many :olympians }
  end

  describe 'attributes' do
    it 'has attributes' do
      team = Team.create(country: 'USA')

      expect(team.country).to eq('USA')
    end
  end
end
