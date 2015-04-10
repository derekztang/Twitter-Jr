get '/' do
  # if current_user
  #   @user = User.where(username: params[:username]).first
  #   erb :user_index
  # else
    erb :index
  # end
  #homepage will contain links to sign up or sign in
end
