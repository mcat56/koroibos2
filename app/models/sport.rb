class Sport < ApplicationRecord
  validates_presence_of :name, uniqueness: true
  has_many :olympians
  has_many :events

end
