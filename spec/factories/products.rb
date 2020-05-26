FactoryBot.define do
  factory :product do
    genre_id {'1'}
    name {'ショートケーキ'}
    price {'1000'}
    introduction {'説明文'}
    is_sale {true}
  end
end
