require 'sinatra/base'
require 'sinatra/reloader'

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

  run! if app_file == $0
  
end