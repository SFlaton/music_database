Artist.delete_all

artists = [
  ["Madonna",
    "Madonna Louise Ciccone (born August 16, 1958) is an American singer, songwriter, actress, and businesswoman.",
    "madonna.jpg"
  ],
   ["Adele",
     "Adele Laurie Blue Adkins (born 5 May 1988) is an English singer and songwriter. ",
     "adele.jpg"
   ],
   ["Justin Bieber",
     "Who doesn't hate him",
     "bieber.jpg"
   ],
   ["Elton John",
     "Sir Elton Hercules John, (born Reginald Kenneth Dwight; 25 March 1947) is an English pianist, singer-songwriter and composer.",
     "sir_elton.jpg"
   ]
]

artists.each do |name, description, image|
  Artist.create(name: name, description: description, image: image)
end


artist_songs = {}

artist_songs["Madonna"] = [
  ["La Isla Bonita", 1986],
  ["Like a Virgin", 1984],
  ["Papa Don't Preach", 1986]
]
artist_songs["Adele"] = [
  ["Hello", 2015],
  ["Rolling in the Deep", 2011],
  ["When We Were Young", 2015]
]
artist_songs["Justin Bieber"] = [
  ["Sorry", 2015],
  ["Baby", 2010],
  ["Never Say Never", 2010]
]
artist_songs["Elton John"] = [
  ["Your Song", 1970],
  ["Sacrifice", 1989],
  ["Tiny Dancer", 1972]
]

artist_songs.each do |artist_name, songs|
  artist = Artist.find_by(name: artist_name)

  songs.each do |title, year|
    Song.create(title: title, artist_id: artist.id, year: year)
  end
end
