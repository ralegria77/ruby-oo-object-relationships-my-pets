class Owner

attr_reader :name, :species
@@all = []

def initialize(name)
  @name = name
  @species = "human"
  @@all << self
end

def say_species
  "I am a #{self.species}."
end

def self.all
  @@all
end

def self.count
  @@all.count #.length would also work
end

def self.reset_all
  @@all.clear
end

def cats
  Cat.all.select {|cat| cat.owner == self} #all the cats that belong to owner
end

def dogs
  Dog.all.select {|dog| dog.owner == self} #returns all the dogs that belong to owner
end

def buy_cat(name)
  Cat.new(name, self)
end

def buy_dog(name)
  Dog.new(name, self)
end

def walk_dogs
  dogs.select {|dog| dog.mood = "happy"}
end

def feed_cats
  cats.select {|cat| cat.mood = "happy"}
end

def sell_pets
  pets = self.dogs + self.cats
  pets.map do |pet| 
  pet.mood = "nervous"
  pet.owner = nil
  end
end

def list_pets
  "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
end



end
