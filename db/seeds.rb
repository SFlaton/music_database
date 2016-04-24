Artist.delete_all
Artist.create( name: "Madonna",description: "Madonna Louise Ciccone (born August 16, 1958) is an American singer, songwriter, actress, and businesswoman.",image: "madonna.jpg" )
Artist.create( name: "Adele",description: "Adele Laurie Blue Adkins (born 5 May 1988) is an English singer and songwriter. ",image: "adele.jpg" )
Artist.create( name: "Justin Bieber",description: "Who doesn't hate him",image: "bieber.jpg" )
Artist.create( name: "Elton John",description: "Sir Elton Hercules John, (born Reginald Kenneth Dwight; 25 March 1947) is an English pianist, singer-songwriter and composer.",image: "sir_elton.jpg" )


artist_songs = {}

artist_songs["Madonna"] = [
  ["La Isla Bonita", 1986, "True Blue", "madonna-true-blue-album.jpg"],
  ["Like a Virgin", 1984, "Like A Virgin", "like_a_virgin_album.png"],
  ["Papa Don't Preach", 1986, "True Blue", "madonna-true-blue-album.jpg"]
]
artist_songs["Adele"] = [
  ["Hello", 2015, "25", "adele25album.jpg"],
  ["Rolling in the Deep", 2011, "21", "adele21album.jpg" ],
  ["When We Were Young", 2015, "25", "adele25album.jpg"]
]
artist_songs["Justin Bieber"] = [
  ["Sorry", 2015, "purpose", "bieberpurposealbum.jpg"],
  ["Baby", 2010, "My World 2.0", "biebermyworldalbum.jpg"],
  ["Never Say Never", 2010, "My World 2.0", "biebermyworldalbum.jpg"]
]
artist_songs["Elton John"] = [
  ["Your Song", 1970, "Elton John", "elton-john-album-cover" ],
  ["Sacrifice", 1989, "Sleeping with the Past", "elton_sleeping_album.jpg"],
  ["Tiny Dancer", 1972, "Madman Across the Water", "elton_madman.jpg"]
]

artist_songs.each do |artist_name, songs|
  artist = Artist.find_by(name: artist_name)

  songs.each do |title, year, album, cover|
    Song.create(title: title, artist_id: artist.id, year: year, album: album, cover: cover)
  end
end
