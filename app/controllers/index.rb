get '/' do
  erb :index
  #homepage will contain links to sign up or sign in
end

get '/users/new' do
  # @user = User.new
  erb :sign_up
end

post '/users/new' do
  #will add user to db
  # @user = User.new(params[:user])
  #if @user.save
    #session[:id] = @user.id
    #redirect '/'
  # else
    #erb: sign_up
  #end
end

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








