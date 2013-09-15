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
  @teams = Team.all
  @afc_north = Team.where(division: 'AFC North')
  @afc_east = Team.where(division: 'AFC East')
  @afc_south = Team.where(division: 'AFC South')
  @afc_west = Team.where(division: 'AFC West')
  @nfc_north = Team.where(division: 'NFC North')
  @nfc_east = Team.where(division: 'NFC East')
  @nfc_south = Team.where(division: 'NFC South')
  @nfc_west = Team.where(division: 'NFC West')
  
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
    redirect('/')
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
    @draft = Draft.create(:creator_id => current_user.id, :number_of_games => params[:number_of_games].to_i,:number_of_rounds => params[:number_of_rounds].to_i,:access => params[:access],:type => params[:type])
    p @draft
    params[:number_of_rounds].to_i.times do |i|
      Round.create(:draft_id => @draft.id, :draft_round_number => i)
    end

    @rounds = Round.where("draft_id = #{@draft.id}")
    @number_of_teams = Team.all.count
    @rounds.each do |round|
      @number_of_teams.times do |i|
        DraftPosition.create(:team_id => i, :round_id => round.id, :position => i)
      end
    end

    @draft = Draft.where("creator_id = #{current_user.id}").last
    @first_round_draft_positions = []
    @draft.rounds.first.draft_positions.each {|dp| @first_round_draft_positions << dp}

    @draft_positions = []
    @draft.rounds.each {|round| round.draft_positions.each {|dp| @draft_positions << dp}}

  return "<p>yeah!</p>"
end

post '/create_gms' do
  @draft = Draft.where("creator_id = #{current_user.id}").last
  @selected_teams = []
  params[:teams].each {|team_name| @selected_teams << Team.find_by_name(team_name)}

  @selected_teams.each do |team|
    GmStint.create(:team_id => team.id, :draft_id => @draft.id)
  end

  @first_round_draft_positions = []
  @draft.rounds.first.draft_positions.each {|dp| @first_round_draft_positions << dp}

  @draft_positions = []
  @draft.rounds.each {|round| round.draft_positions.each {|dp| @draft_positions << dp}}

  return "<p>hell yeah!</p>"

end

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
