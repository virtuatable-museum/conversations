# frozen_string_literal: true

FactoryBot.define do
  factory :empty_session, class: Arkaan::Authentication::Session do
    factory :session do
      token { Faker::Alphanumeric.unique.alphanumeric(number: 32) }
    end
  end
end
