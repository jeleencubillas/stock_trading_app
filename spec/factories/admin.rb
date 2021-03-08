FactoryBot.define do
    factory :admin do
      email { "admin@email.com" }
      password  { "test123456" }
      username  { "test" }

    end
  end
  