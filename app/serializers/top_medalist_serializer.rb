class TopMedalistSerializer
  attr_reader :name, :events

  def initialize(medalist)
    @name = medalist.name
    @events = medal_events(medalist)
    @total_medals_won = @events.length
  end


  def medal_events(medalist)
    olympian_events = medalist.olympian_events.where(medal: ['Bronze', 'Silver', 'Gold'])
    events = []
    olympian_events.each do |olympian_event|
      events << { event: olympian_event.event.name, medal: olympian_event.medal }
    end
    events
  end
end
