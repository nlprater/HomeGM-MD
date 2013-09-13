require 'faker'

10.times do
  User.create(:username => Faker::Lorem.characters(char_count = 10),:email => "email@email.com",:password => "password",:password => "password",:password_confirmation => "password")
end

20.times do
  Draft.create(:creator_id => rand(1..10))
end

20.times do |i|
  Round.create(:draft_id => i, :draft_round_number => 1)
end

32.times do
  Team.create(:name => Faker::Lorem.characters(char_count = 9),:division => "AFC North",:conference => "AFC",:location => Faker::Lorem.characters(char_count = 12))
end

500.times do
  Player.create(:full_name => Faker::Lorem.word,:position => "QB",:college_year => "senior",:college => "LSU")
end

640.times do |i|
  DraftPosition.create(:team_id => (i > 32 ? i % 32 : i),:round_id => 1, :position => (i > 32 ? i % 32 : i))
end

640.times do |i|
  Selection.create(:user_id => rand(1..10),:draft_id => i > 20 ? i % 20 : i,:team_id => (i > 32 ? i % 32 : i),:round_id => 1,:player_id => rand(1..500), :draft_position_id => i, :overall_position => i > 32 ? i % 32 : i)
end

