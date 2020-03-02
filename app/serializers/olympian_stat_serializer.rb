class OlympianStatSerializer
  attr_reader :olympian_stats

  def initialize(olympians)
    @olympian_stats = {
      total_competing_olympians: olympians.length,
      average_weight: {
        unit: 'kg',
        male_olympians: average_male_weight(olympians),
        female_olympians: average_female_weight(olympians)
      },
      average_age: average_age(olympians)
    }
  end

  def average_male_weight(olympians)
    olympians.where(sex: 'M').average(:weight).to_f.round(1)
  end

  def average_female_weight(olympians)
    olympians.where(sex: 'F').average(:weight).to_f.round(1)
  end

  def average_age(olympians)
    olympians.average(:age).to_f.round(1)
  end
end
