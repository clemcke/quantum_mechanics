INSTALLATION:
set up a .env w/S3 credentials and start using
heroku config:pull --overwrite --interactive
foreman run rails s

TODO:

implement file upload using paperclip and s3
build front-end for file upload
remove credentials.rb references and ssh code in song.rb
Track different takes of the same song
tag players in the jam
comments
imbedded file player (http://www.jplayer.org/)
autocomplete track name for new tracks


DESCRIPTION:

Song:
name
file data or url to file location
date recorded
users involved
Comments
  by user
likes?  keep/toss/maybe?

create new song:

User
  name
  password

Interface:
  search bar
  searchable, sortable song listing
  song info:  plays song, 
  shows attributes, 
  shows comments, 
  allows commenting if logged in

DESIGN IDEAS:
grey out navbar after scroll
