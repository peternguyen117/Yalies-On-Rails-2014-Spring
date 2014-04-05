require "sinatra"
#To get this next line to work, run `gem install sinatra-contrib` first
require "sinatra/reloader" if development?

configure do
  enable :sessions
end


#New, RESTful code skeleton!
#The old style of the code is available in the folder EXAMPLE


##INDEX
##Main Welcome Page
get '/' do
  erb :index
end

##NEW page
get '/sets/new' do
  erb :new
end

##CREATE page
post "/sets" do
  binding.pry
  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #set the session stuff for the set to equal the right things
  "success creating!" #just for testing, we shouldn't render this in the end but instead render an erb
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##SHOW page
get "/sets/:setname" do
  #find the set in session, set the variables to @variables so the view can have them
  erb :show #just describe what the set has in it, displaying that on the page
end

##PLAY page
get "/sets/:setname/play" do
  #find the set in session
  #Pull out a random videonumber and set that to an @variable so the view can have it
  erb :play #actually plays the embedded video!
end

##EDIT page
get "/sets/:setname/edit" do
  #parse the youtubelinks params into separate video numbers - from a comma separated string into an array
  #find the setname, set the variables to @variables so the view can have them - it will make them the form defaults
  erb :edit #same as new except it puts in the form defaults.
end

##UPDATE page
put "/sets/:setname" do
  #find setname in session
  #update the variables in session to match parameters
  "success updating!" #just for testing, we shouldn't render this in the end but instead render an erb
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end

##DESTROY page
delete "/sets/:setname" do
  #delete the set setname from session
  "success deleting!" #just for testing, we shouldn't render this in the end but instead render an erb
  #erb :index #we'll want it to redirect to index later (maybe optionally with a status message at the top?)
end




#Session page for troubleshooting the session
get '/session' do
  session[:sessiontestvariable] = 3.14
  session.inspect
end