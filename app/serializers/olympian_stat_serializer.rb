class OlympianStatSerializer
  attr_reader :olympian_stats

  def initialize(olympians)
    @olympian_stats = {
      total_competing_olympians: olympians.length,
      total_male_olympians: male_olympians(olympians),
      total_female_olympians: female_olympians(olympians),
      average_weight: {
        unit: 'kg',
        male_olympians: average_male_weight(olympians),
        female_olympians: average_female_weight(olympians)
      },
      average_height: {
        unit: 'cm',
        male_olympians: average_male_height(olympians),
        female_olympians: average_female_height(olympians),
      },
      average_age: average_age(olympians)
    }
  end

  def male_olympians(olympians)
    olympians.where(sex: 'M').length
  end

  def female_olympians(olympians)
    olympians.where(sex: 'F').length
  end

  def average_male_weight(olympians)
    olympians.where(sex: 'M').average(:weight).to_f.round(1)
  end

  def average_female_weight(olympians)
    olympians.where(sex: 'F').average(:weight).to_f.round(1)
  end

  def average_male_height(olympians)
    olympians.where(sex: 'M').average(:height).to_f.round(1)
  end

  def average_female_height(olympians)
    olympians.where(sex: 'F').average(:height).to_f.round(1)
  end

  def average_age(olympians)
    olympians.average(:age).to_f.round(1)
  end
end
