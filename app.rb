require 'sinatra/base'
require 'sinatra/reloader'

require_relative './lib/diaryentry'

class DailyDiary < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    erb(:index)
  end

  post '/diaryentries' do
    DiaryEntry.create(
      title: params[:title],
      content: params[:content]
    )
    redirect '/diaryentries'
  end

  get '/diaryentries' do
    @entries = DiaryEntry.all
    erb(:diaryentries)
  end

  run! if app_file == $0
  
end