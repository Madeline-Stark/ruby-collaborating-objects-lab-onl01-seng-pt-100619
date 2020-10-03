class MP3Importer
    attr_reader :path
  
    def initialize(path)
      @path = path
    end
  
    def files
        #binding.pry
      # put in pry
      #GLOB:
      #glob processes files from directory
      #Dir.glob selects all files in the current directory that match the given condition
      #conditions determined by wildcards
      #wildcards:
      # * a single asterisk before the file extension will search the current directory 
      # ** will match all directories
      # ? represents one character
      # Dir.glob takes argument

      # path is  "./spec/fixtures/mp3s” which loads files from spec/fixtures/mp3s
      #.mp3 is kind of files we want to load, could also just do /* after path as all .mp3s anyway
      # put just that in pry: Dir.glob("#{path}/*.mp3”)

      # then how to take out path from name-gsub
      # / indicates file path

      #gsub is a string class method in Ruby which is used to return a copy of the given string with all occurrences of pattern substituted for the second argument
      # ex: "today is friday".gsub("friday", "saturday")
      @files ||= Dir.glob("#{path}/*.mp3").collect{ |f| f.gsub("#{path}/", "") }
    end
  
    def import
      files.each{|f| Song.new_by_filename(f)}
    end
  end