FactoryBot.define do
  factory :member do
    family_name {"山田"}
    first_name {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    email {"test@email.com"}
    postal_code {"2345566"}
    address {"東京都"}
    tel {"0807775555"}
    password {"password"}
  end
end
