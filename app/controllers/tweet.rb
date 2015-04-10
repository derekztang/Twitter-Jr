get '/tweets/new' do
 erb :"tweet/new_tweet"
end

post '/tweets' do
  @new_tweet = Tweet.create!(content: params[:content], user_id: current_user.id)
  redirect "/users/#{current_user.id}/feed"
end

get '/tweets/:id/edit' do
  @tweet = Tweet.find(params[:id])
  erb :"tweet/edit_tweet"
end

put '/tweets/:id' do
  @tweet = Tweet.find(params[:id])
  @tweet.content = params[:content]
  @tweet.save
  redirect '/tweets'
end

get '/tweets' do
  @tweet = Tweet.all
  erb :'tweet/index'
end

delete '/tweets/:id' do
  Tweet.find(params[:id]).destroy
  redirect '/tweets'
end
