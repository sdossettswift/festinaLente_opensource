FactoryGirl.define do
  factory :expense do
    project ""
    reimburseable false
    mileage 1
    tolls 1.5
    courier 1.5
    other 1.5
    date "2017-01-07"
    user ""
  end
end
