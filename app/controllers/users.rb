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
  # erb :
end

