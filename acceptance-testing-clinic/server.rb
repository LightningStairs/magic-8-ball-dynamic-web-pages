require "sinatra"
require_relative 'answers'

set :bind, "0.0.0.0"

get '/' do
  erb :index
end

post '/answer' do
  if params[:question] != ''
    @question = params[:question]
    @answer = ANSWERS.sample
    erb :show
  else
    @error = "Please ask a question! Magic 8-Ball tells the future, it cannot read your mind!"
    erb :index
  end

end
