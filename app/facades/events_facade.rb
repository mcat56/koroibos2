class EventsFacade
  attr_reader :events

  def initialize
    sports = Sport.all
    @events = { events: [] }
    sports.each { |sport| @events[:events] << SportSerializer.new(sport) }
  end
end
