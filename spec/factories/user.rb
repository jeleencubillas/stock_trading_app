FactoryBot.define do
  factory :user do
    email {"test@email.com"}
    password {"123456"}
		first_name { "Test" }
		last_name { "Tester" }
		date_of_birth { "16/05/1993" }
  end
end