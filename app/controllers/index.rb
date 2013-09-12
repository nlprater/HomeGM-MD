#GET ============================================

#user creation and auth

get '/' do
  erb :index
end

get '/login' do
  erb :login
end

get '/create_user' do
  erb :create_user
end

get '/user/profile' do
  if logged_in?
    #to this
    erb :profile
  else
    redirect('/login')
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

#primary object 

get '/all_mains' do
  #@all_mains = Main.all
  erb :all_mains
end

#create dynamic form

get '/create_main' do 
  erb :create_main
end

# display dynamic form for user input

get '/take_main/:main_id' do
  @main_id = params[:main_id]
  erb :take_main
end




#POST ===============================================

#user creation and auth

post '/login' do
  @user = User.find_by_username(params[:user][:username])

  if @user && @user.authenticate(params[:user][:password])
    session[:user_id] = @user.id
    redirect('/user/profile')
  else
    @error = "Whatchu talkin bout, Willis?"
    erb :login
  end
end

post '/create_user' do  
  @user = User.new(params[:user])

  if @user.save
    session[:user_id] = @user.id
    redirect to '/user/profile'
  else
    @error = "You messed up, sucka!"
    erb :create_user
  end
end

#create new "main" in the database

post '/create_main' do 
  #
end

#user submit 'main'

post '/take_main/:main_id' do
  if logged_in?
    # 
    redirect to '/all_mains'
  else
    redirect to '/login'
  end
  redirect to "/user/profile"
end

#upload file

post '/upload' do
  photo = Photo.create(name: "profile",user_id: current_user.id)
  photo.file = params[:image]
  photo.save
  redirect('/user/profile')
end
