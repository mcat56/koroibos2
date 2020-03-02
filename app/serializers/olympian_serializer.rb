class OlympianSerializer
  attr_reader :name, :age, :team, :sport, :total_medals_won
  
  def initialize(olympian)
    @name = olympian.name
    @age = olympian.age
    @team = olympian.team.country
    @sport = olympian.sport.name
    @total_medals_won = olympian.total_medals
  end
end
