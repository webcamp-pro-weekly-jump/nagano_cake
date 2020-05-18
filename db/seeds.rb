# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Genre.create!(
	 name: 'ケーキ',
	 is_valid: true )

Genre.create!(
	 name: 'クッキー',
	 is_valid: true )

Genre.create!(
	 name: 'プリン',
	 is_valid: true )

Genre.create!(
	 name: 'キャンディ',
	 is_valid: true )

Product.create!(
	genre_id: 1,
	name: 'ショートケーキ',
	price: '1000',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 1,
	name: 'チーズケーキ',
	price: '1000',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 2,
	name: 'チョコクッキー',
	price: '500',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 3,
	name: 'クレームブリュレ',
	price: '600',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 4,
	name: 'キャンディ',
	price: '500',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 1,
	name: 'チョコレートケーキ',
	price: '800',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 3,
	name: 'ババロア',
	price: '700',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 3,
	name: 'マンゴープリン',
	price: '500',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 1,
	name: 'ザッハトルテ',
	price: '1500',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 2,
	name: 'ジンジャークッキー',
	price: '200',
	introduction: '説明文',
	is_sale: true)

Product.create!(
	genre_id: 2,
	name: 'バタークッキー',
	price: '500',
	introduction: '説明文',
	is_sale: true)