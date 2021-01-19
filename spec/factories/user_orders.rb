FactoryBot.define do
  factory :user_order do
    zip_code         {"111-1111"}
    area_id          {2}
    municipality     {"札幌市"}
    address          {"北区1-1"}
    building         {"札幌ビルディング"}
    telephone_number {"09012345678"}
    token            {"tok_abcdefghijk00000000000000000"}
  end
end
