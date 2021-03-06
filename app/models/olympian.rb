class Olympian < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  validates_presence_of :sex, :age, :weight, :height
  belongs_to :team
  belongs_to :sport
  has_many :olympian_events
  has_many :events, through: :olympian_events
  has_many :games, through: :events


  def total_medals
    OlympianEvent.where(olympian_id: self.id, medal: ['Bronze', 'Silver', 'Gold']).length
  end

  def self.top_male
    Olympian.where(sex: 'M').max { |a, b| a.total_medals <=> b.total_medals }
  end

  def self.top_female
    Olympian.where(sex: 'F').max { |a, b| a.total_medals <=> b.total_medals } 
  end
end
