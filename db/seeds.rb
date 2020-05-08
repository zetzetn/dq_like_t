EMAIL = 'test@example.com'
PASSWORD = 'password'

# テストユーザーが存在しないときだけ作成する
# email持ってる人おったら引っ張ってこいいなければ作れ！
User.find_or_create_by!(email: EMAIL) do |user|
  user.password = PASSWORD
end

system 'rake import_csv:monster_data'

# 経験値テーブルをデータベースに投入
system 'rake import_csv:exp_data'

puts "初期データの投入に成功しました。"