class SportSerializer
  attr_reader :sport, :events

  def initialize(sport)
    @sport = sport.name
    @events = sport_events(sport)
  end

  def sport_events(sport)
    Event.where(sport_id: sport.id).pluck(:name)
  end
end
