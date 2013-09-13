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

get '/drafts' do
  #@all_mains = Main.all
  erb :drafts
end

#create dynamic form

get '/create_draft' do 
  erb :create_draft
end

# display dynamic form for user input

get '/perform_draft/:draft_id' do
  @draft_id = params[:draft_id]
  erb :perform_draft
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

post '/create_draft' do 
  #
end

#user submit 'main'

post '/perform_draft/:draft_id' do
  if logged_in?
    # 
    redirect to '/drafts'
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
