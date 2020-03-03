class OlympiansFacade
  attr_reader :olympians

  def initialize(query)
    if query == 'youngest'
      olympians = Olympian.order(:age).limit(1)
    elsif query == 'oldest'
      olympians = Olympian.order(age: :desc).limit(1)
    else
      olympians = Olympian.all
    end
    @olympians = { olympians: [] }
    olympians.each { |olympian| @olympians[:olympians] << OlympianSerializer.new(olympian) }
  end
end
