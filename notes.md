MIGRATIONS
rails g migration create_artists name:string bio:text --no-test-framework
rails g migration create_genres name:string --no-test-framework
rails g migration create_songs name:string artist_id:integer genre_id:integer --no-test-framework
rails db:migrate
rails db:migrate RAILS_ENV=test

MODELS

rails g model Author name:string genre:string bio:text --no-test-framework