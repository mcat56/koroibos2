require 'rails_helper'

describe Game do
  describe 'validations' do
    it { should validate_presence_of :name }
  end

  describe 'relationships' do
    it { should have_many :events }
  end

  describe 'attributes' do
    it 'has attributes' do
      game = Game.create(name: 'Summer 2016')

      expect(game.name).to eq('Summer 2016')
    end
  end
end
