namespace :db do
	desc "Fill database with sample data"
	
	task populate_many: :environment do
		make_users
	end

	task populate_rankida: :environment do
	rankida = User.create!(name: "David Rankin",
											 email: "rankida@gmail.com",
											 password: "foobar",
											 password_confirmation: "foobar")
	rankida.toggle!(:admin)
	end
end

def make_users
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@rankida.com"
		password = "password"
		User.create!(name: name,
								 email: email,
								 password: password,
								 password_confirmation: password)
	end
end