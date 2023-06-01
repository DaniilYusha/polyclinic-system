FactoryBot.define do
  factory :appointment do
    datetime { 5.days.from_now }
    doctor
    patient
  end
end
