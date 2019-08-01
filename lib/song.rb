class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def self.create
    song = Song.new
    @@all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end
  
  def self.find_by_name(name)
     self.all.detect{|song| song.name == name}
  end
  
   def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    return song
  end
  
   def save
     self.class.all << self
  end
  
  def self.find_or_create_by_name(name)
     song = self.find_by_name(name)
     if song then
        return song
      else
        self.create_by_name(name)
      end
  end
    
  def self.alphabetical
      self.all.sort_by{|s| s.name}
  end
   
  def self.new_from_filename(filename)
          array=[]
          new_ar=[]
          array=filename.split("- ")
          artist_name=array[0]
          new_ar=array[1].partition(".")
          name=new_ar[0]
          song = self.new
          song.artist_name = artist_name
           @@all << song
            song = self.new
          song.name = name
          @@all << song
         return @@all
     end
  end

