class TopMedalistsFacade
  attr_reader :top_medalists

  def initialize
    top_male = Olympian.top_male
    top_female = Olympian.top_female
    @top_medalists = { top_medalists: {} }
    @top_medalists[:top_medalists][:male] = TopMedalistSerializer.new(top_male)
    @top_medalists[:top_medalists][:female] = TopMedalistSerializer.new(top_female)
  end
end
