
get '/sessions/new' do
  @user = User.new
  erb :sign_in
end

post '/sessions/new' do
  @user = User.where(username: params[:username]).first_or_initialize
  if @user.persisted? && @user.password == params[:password]
    session[:id] = @user.id
    redirect "/users/#{@user.id}/feed"
  else
    # redirect '/sessions/new'
    status 401
    erb :sign_in
  end
end

delete '/sessions/logout' do
  session[:id] = nil
  redirect '/'
end
