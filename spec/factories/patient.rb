FactoryBot.define do
  factory :patient do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    phone { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub(/-|\s/, '') }
    password { 'Password123!' }
  end
end
