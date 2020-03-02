class Team < ApplicationRecord
  validates_presence_of :country, uniqueness: true
  has_many :olympians
end
