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
  p @followee_tweets = @user.followee_tweets
  erb :"user/followee_feed" #only display the newest 20
end

get '/users/:id' do
  @user = User.find(params[:id])
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
