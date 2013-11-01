FactoryGirl.define do
  factory :tufts_self_deposit do
    ignore do
      user { FactoryGirl.create(:user) }
    end
    sequence(:title) {|n| "Title #{n}" }
    after(:build) { |deposit, evaluator|
      deposit.apply_depositor_metadata(evaluator.user.user_key)
    }
    rights { 'http://dca.tufts.edu/ua/access/rights-creator.html' }
  end
end
