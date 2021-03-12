# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
%W[アニメ ドラマ 恋愛 ホラー 戦争 音楽 ミュージカル スポーツ SF 青春 コメディ アクション アドベンチャー ドキュメンタリー ショートフィルム サスペンス ファミリー ファンタジー ミステリー 歴史].each{ |sample| Category.create(name: sample)}