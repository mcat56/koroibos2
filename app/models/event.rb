class Event < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  belongs_to :sport
  belongs_to :game
  has_many :olympian_events
  has_many :olympians, through: :olympian_events

end
