require 'pry'
class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs
  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new_artist = Artist.new(name)
    new_artist.save
    new_artist
  end

  def add_song(new_song)
    unless new_song.artist
      new_song.artist = self
    end

    if !@songs.include?(new_song)
      @songs << new_song
    end
  end

  def genres
    genre_array = @songs.map do |song|
      song.genre
    end
    genre_array.uniq
  end
end
