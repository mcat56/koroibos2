class OlympianEvent < ApplicationRecord
  validates_presence_of :medal
  belongs_to :olympian
  belongs_to :event

  validates_uniqueness_of :olympian_id, :scope => [:event_id]
end
