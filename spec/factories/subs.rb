# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :k_sub, class: Sub do
    title  "katies_sub"
    mod_id "1"
  end

  factory :j_sub1, class: Sub do
    title "j_sub1"
    mod_id "4"
  end

  factory :j_sub2, class: Sub do
    title "j_sub2"
    mod_id "4"
  end

end
