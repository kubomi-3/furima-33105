FactoryBot.define do
  factory :user do
    nickname                { 'test' }
    email                   { 'test@sample' }
    password                { '111aaa' }
    password_confirmation   { password }
    last_name               { '佐藤' }
    first_name              { '真男' }
    first_name_kana         { 'サトウ' }
    last_name_kana          { 'マサオ' }
    birthday                { '2000-2-4' }
  end
end
