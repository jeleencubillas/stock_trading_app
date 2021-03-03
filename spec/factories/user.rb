FactoryBot.define do
  factory :user do
    email {"test@email.com"}
    password {"123456"}
		first_name { "Test" }
		last_name { "Tester" }
		age { 19 }
  end
end