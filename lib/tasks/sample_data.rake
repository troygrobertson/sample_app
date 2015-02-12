namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		puts "creating admin"
		1.times do |n|
			name=Faker::Name.name
			email="admin@example.org"
			password = "foobar"
			admin=Admin.create!()
			admin.build_user(name: name,
				     email: email,
				     password: password,
				     password_confirmation: password)
			unless admin.save
				puts "error creating admin"
			end
		end
		puts "creating director"
		1.times do |n|
			name=Faker::Name.name
			email="director@example.org"
			password = "foobar"
			admin=Admin.create!(director: true)
			admin.build_user(name: name,
				     email: email,
				     password: password,
				     password_confirmation: password)
			unless admin.save
				puts "error creating director"
			end
		end
		puts "creating doctors"
		2.times do |n|
			name=Faker::Name.name
			email="exampleDoc-#{n+1}@example.org"
			password = "foobar"
			doctor=Doctor.create!()
			doctor.build_user(name: name,
				     email: email,
				     password: password,
				     password_confirmation: password)
			unless doctor.save
				puts "error creating doctor"
			end
		end
		puts "creating Patients"
		10.times do |n|
			name=Faker::Name.name
			h=1 + n
			w=1 + n
			hNumber=n + 4561237
			email="examplePat-#{n+1}@example.org"
			password="foobar"
			if n<5
			doctorId=1
			else
			doctorId=2
			end
			patient=Patient.create!(
					emergencyContact: Faker::Name.name,
					emergencyPhoneNumber: Faker::PhoneNumber.phone_number,
					dateOfBirth: rand(11.year).ago,
					familyDoctor: Faker::Name.name,
					healthCardNumber: hNumber,
					phoneNumber: Faker::PhoneNumber.phone_number,
					weight: w,
					height: h,
					currentMedication: Faker::Name.name,
					currentIssue: Faker::Name.name,
					doctor_id: doctorId)
			 patient.build_user(name: name,
				     email: email,
				     password: password,
				     password_confirmation: password)
			unless patient.save
				puts "error creating patient"
			end
		end
		
		puts "creating Pools"
		10.times do |n|
			name=Faker::Commerce.department(1)
			description="sample description"
			specialization="sample specialization"
			Pool.create!(name: name,
			description: description,
			specialization: specialization)
			
			
		
		end
		10.times do |n|
		Permission.create!(user_id: 2,
		pool_id: n+1)
		end
		Message.create!(
		message: "hello",
		user_id: 1,
		messageable_id: 2,
		messageable_type: "User"
		)
	end
end
