# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :play do

    after(:build) do |play|
      play.roles << FactoryGirl.buil(:role, play: play)
    end

  end
end
