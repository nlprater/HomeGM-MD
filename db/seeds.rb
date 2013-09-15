require 'faker'

1.times do
  User.create(:username => "nprater",:email => "prater.nick@gmail.com",:password => "password",:password_confirmation => "password")
end

# 20.times do
#   Draft.create(:creator_id => rand(1..10),:number_of_rounds => 3,)
# end

# 20.times do |i|
#   Round.create(:draft_id => i, :draft_round_number => 1)
# end

  Team.create(:name => "Browns",:division => "AFC North",:conference => "AFC")
  Team.create(:name => "Steelers",:division => "AFC North",:conference => "AFC")
  Team.create(:name => "Ravens",:division => "AFC North",:conference => "AFC")
  Team.create(:name => "Bengals",:division => "AFC North",:conference => "AFC")
  Team.create(:name => "Patriots",:division => "AFC East",:conference => "AFC")
  Team.create(:name => "Jets",:division => "AFC East",:conference => "AFC")
  Team.create(:name => "Dolphins",:division => "AFC East",:conference => "AFC")
  Team.create(:name => "Bills",:division => "AFC East",:conference => "AFC")
  Team.create(:name => "Titans",:division => "AFC South",:conference => "AFC")
  Team.create(:name => "Colts",:division => "AFC South",:conference => "AFC")
  Team.create(:name => "Texans",:division => "AFC South",:conference => "AFC")
  Team.create(:name => "Jaguars",:division => "AFC South",:conference => "AFC")
  Team.create(:name => "Broncos",:division => "AFC West",:conference => "AFC")
  Team.create(:name => "Chiefs",:division => "AFC West",:conference => "AFC")
  Team.create(:name => "Raiders",:division => "AFC West",:conference => "AFC")
  Team.create(:name => "Chargers",:division => "AFC West",:conference => "AFC")
  Team.create(:name => "Rams",:division => "NFC West",:conference => "NFC")
  Team.create(:name => "49ers",:division => "NFC West",:conference => "NFC")
  Team.create(:name => "Seahawks",:division => "NFC West",:conference => "NFC")
  Team.create(:name => "Cardinals",:division => "NFC West",:conference => "NFC")
  Team.create(:name => "Saints",:division => "NFC South",:conference => "NFC")
  Team.create(:name => "Bucaneers",:division => "NFC South",:conference => "NFC")
  Team.create(:name => "Panthers",:division => "NFC South",:conference => "NFC")
  Team.create(:name => "Falcons",:division => "NFC South",:conference => "NFC")
  Team.create(:name => "Lions",:division => "NFC North",:conference => "NFC")
  Team.create(:name => "Bears",:division => "NFC North",:conference => "NFC")
  Team.create(:name => "Packers",:division => "NFC North",:conference => "NFC")
  Team.create(:name => "Vikings",:division => "NFC North",:conference => "NFC")
  Team.create(:name => "Cowboys",:division => "NFC East",:conference => "NFC")
  Team.create(:name => "Eagles",:division => "NFC East",:conference => "NFC")
  Team.create(:name => "Redskins",:division => "NFC East",:conference => "NFC")
  Team.create(:name => "Giants",:division => "NFC East",:conference => "NFC")

500.times do
  Player.create(:full_name => "Barkevious Mingo",:position => "OLB",:college_year => "Senior",:college => "LSU")
end

# 640.times do |i|
#   DraftPosition.create(:team_id => (i > 32 ? i % 32 : i),:round_id => 1, :position => (i > 32 ? i % 32 : i))
# end

# 640.times do |i|
#   Selection.create(:user_id => rand(1..10),:draft_id => i > 20 ? i % 20 : i,:team_id => (i > 32 ? i % 32 : i),:round_id => 1,:player_id => rand(1..500), :draft_position_id => i, :overall_position => i > 32 ? i % 32 : i)
# end

