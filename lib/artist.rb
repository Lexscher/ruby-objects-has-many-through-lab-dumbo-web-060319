class Artist

    attr_accessor :name
    attr_reader :songs

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_song(song_title, genre)
        song = Song.new(song_title, self, genre)
    end

    def songs
        Song.all.select do |song|
            song.artist == self
        end
    end

    def genres
        genre_list = []
        self.songs.each do |song|
            genre_list << song.genre
        end
        genre_list
    end

    

end