FactoryBot.define do
  factory :empty_account, class: Arkaan::Account do
    factory :account do
      username { Faker::LeagueOfLegends.unique.champion }
      password { 'super_strong_password' }
      password_confirmation { 'super_strong_password' }
      email { Faker::Internet.unique.safe_email }
      lastname { Faker::Name.last_name }
      firstname { Faker::Name.first_name }
    end
  end
end