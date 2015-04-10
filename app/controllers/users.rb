get '/users/new' do
  @user = User.new
  erb :sign_up
end

post '/users/new' do
  unless params[:user][:password].empty?
    @user = User.new(params[:user])
    if @user.save
      session[:id] = @user.id
      redirect "/users/#{@user.id}/feed"
    else
      erb :sign_up
    end
  end
end

get '/users/:id/feed' do
  @user = User.where(id: params[:id]).first
  @followee_tweets = @user.followee_tweets
  erb :"user/followee_feed" #only display the newest 20
end

get '/users/:id' do
  @user = User.find(params[:id])
  @tweets = Tweet.where(user_id: params[:id])
  erb :profile
end

get '/users/:id/edit' do
  @user = User.find(params[:id])
  erb :edit_profile
end

put '/users/:id' do
  @user = User.find(params[:id])
  @user.user_bio = params[:user_bio]
  @user.user_bio_picture = params[:user_bio_picture]
  @user.save
  redirect "/users/#{@user.id}"
end

get '/users/:id/followees' do
  @user = User.find(params[:id])
  @followees = @user.followees
  erb :"user/followees"
end

post '/users/:id/follow' do
  @user = User.find(params[:id])
  @user.followers << User.find(session[:id])
  redirect "/users/#{@user.id}"
end
