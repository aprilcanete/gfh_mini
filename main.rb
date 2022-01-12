     
require 'sinatra'
# require 'sinatra/reloader' # turn off when deploying
require 'pg'

def db_query(sql, params = [])
  conn = PG.connect(ENV['DATABAS_URL'])
  result = conn.exec_params(sql, params)

  conn.close

  result
end

def all_dishes()
  db_query('select * from dishes;')
end

get '/' do
  dishes = all_dishes()

  erb :index, locals: {dishes: dishes}
end

get '/about' do
  erb :about
end




