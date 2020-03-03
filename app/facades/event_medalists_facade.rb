class EventMedalistsFacade
  attr_reader :event_medalists

  def initialize(event)
    medalists = event.get_medalists
    @event_medalists = { event: event.name,
      medalists: [] }
    medalists.each {|medalist| @event_medalists[:medalists] << MedalistSerializer.new(event, medalist)}
  end
end
