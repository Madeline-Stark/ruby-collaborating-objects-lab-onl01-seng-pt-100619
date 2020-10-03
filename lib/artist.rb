class Artist
    @@all = []
    attr_accessor :name, :songs
  
    def initialize(name)
      @name = name
      save
    end
  
    def self.all
      @@all    
    end
  
    def add_song(song)
        # still maintaining single source of truth-keeping track on song side
      song.artist = self
    end
  
    def songs
      #want to create association on one side-the belongs to-so less potential for error
      #select returns all elements for which block is true-as opposed to find or detect
      Song.all.select {|song| song.artist == self}
    end
  
    def self.find_or_create_by_name(name)
      self.find(name) ? self.find(name) : self.new(name)
    end
  
    def self.find(name)
      self.all.find {|artist| artist.name == name }
    end
  
    def save
      @@all << self
    end
  
    def print_songs
      songs.each {|song| puts song.name}
    end
  end