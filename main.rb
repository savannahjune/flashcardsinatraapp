require 'sinatra'
require 'slim'
require 'sass'
require 'data_mapper'
require 'dm-sqlite-adapter'
require 'json'

DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/flashcards.db")

class Flashcard
  include DataMapper::Resource
  property :id,           Serial
  property :word,         String, :required => true
  property :definition,	  Text, :required => true
  property :difficulty,   Integer, :required => true
end


DataMapper.finalize

get ('/style.css') { content_type 'text/css', :charset => 'utf-8' ; scss :style }

# simple request to show first flaschard on main page when it initially loads

get '/' do
	@flashcard = Flashcard.get(1)
	slim :index
end

# this get request allows users to go through flashcards by id

get '/flashcard/:id' do

	@flashcard = Flashcard.get(params[:id])
	puts 'got flashcard for id #{params[:id]}'
	puts :flashcard

	content_type :json
	@flashcard.to_json
end

# this request gets all flashcards for display on '/flashcards' page

get '/flashcards' do
	@flashcards = Flashcard.all
	slim :flashcards
end

# this requestion allows users to create flashcards from landing page

post '/flashcard' do
	
	puts "creating flashcard with data #{params[:flashcard]}"
	Flashcard.create params[:flashcard]
end

# this request allows users to edit cards from /flashcards page

put '/flashcard/:id' do

	request.body.rewind
	data = (JSON.parse request.body.read)['flashcard']

	puts data
	
	@flashcard = Flashcard.get(params[:id])

	result = @flashcard.update(:word => data['word'],
					  :definition => data['definition'],
					  :difficulty => data['difficulty'])

	# result is true if it works, false if not
	puts result

	if result == true
		@flashcard.save
	end

	content_type :json
	@flashcard.to_json	

end
