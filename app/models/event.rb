class Event < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  belongs_to :sport
  belongs_to :game
  has_many :olympian_events
  has_many :olympians, through: :olympian_events


  def get_medalists
    ids = Event.where(id: self.id).joins(:olympian_events).where("olympian_events.medal in ('Gold', 'Silver')").order('olympian_events.medal').pluck('olympian_events.olympian_id')
    Olympian.find(ids)
  end
end
