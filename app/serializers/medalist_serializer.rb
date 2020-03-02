class MedalistSerializer
  attr_reader :name, :team, :age, :medal

  def initialize(event, medalist)
    @name = medalist.name
    @team = medalist.team.country
    @age = medalist.age
    @medal = get_medal(event, medalist).first
  end

  def get_medal(event,medalist)
    OlympianEvent.where(event_id: event.id, olympian_id: medalist.id).pluck(:medal)
  end

end
