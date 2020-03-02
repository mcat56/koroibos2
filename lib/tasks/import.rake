require 'csv'

desc 'import_files'
namespace :import do |import|
  task :olympic_data => :environment do
    CSV.foreach('data/summer_2016_games.csv', headers: true ) do |row|
      game = Game.find_or_create_by(name: row['Games'])
      sport = Sport.find_or_create_by(name: row['Sport'])
      team = Team.find_or_create_by(country: row['Team'])
      olympian = Olympian.find_or_create_by(
        name: row['Name'],
        sex: row['Sex'],
        age: row['Age'],
        height: row['Height'],
        weight: row['Weight'],
        team: team,
        sport: sport )
      event = Event.find_or_create_by(name: row['Event'], sport: sport, game: game)
      OlympianEvent.create(
        olympian: olympian,
        event: event,
        medal: row['Medal']
      )
    end
  end
end
