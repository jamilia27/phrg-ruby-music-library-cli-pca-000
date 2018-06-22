class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    user_input = nil

    while user_input != exit
      greeting
      input = gets.strip.downcase

      case input
      when 'list songs'
        list_songs
      end
    end
  end

  def greeting
    puts "Welcome to you music library!"
    puts "To list all of your songs, enter 'list songs'"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end

  def list_songs
    Song.all.each.with_index(1) do |v,i|
      binding.pry
      puts "#{i}. #{v}"
    end
  end
end
