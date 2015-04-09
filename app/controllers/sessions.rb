
get '/sessions/new' do
  erb :sign_in
end

post '/sessions/new' do
  @user = User.where(username: params[:username]).first
  if @user && @user.password == params[:password]
    session[:id] = @user.id
    redirect '/'
  else
    @errors = "Login Failed"
    redirect '/sessions/new'
  end
end

delete '/sessions/logout' do
  session[:id] = nil
  redirect '/'
end
