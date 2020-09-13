FactoryBot.define do
  factory :empty_application, class: Arkaan::OAuth::Application do
    factory :application do
      name { Faker::App.unique.name }
      key { Faker::Alphanumeric.unique.alphanumeric(number: 32) }
      premium { false }

      factory :premium_application do
        premium { true }
      end
    end
  end
end