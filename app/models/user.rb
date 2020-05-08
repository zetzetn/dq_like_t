class User < ApplicationRecord

  # ユーザーが作成されたときに作動
  after_create :create_initial_setting

  # Brave クラスとは 1:1 の関係
  has_one :brave, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  # ユーザーが作成されたときに，動作するメソッド
  def create_initial_setting
    # has_one の場合は，user.brave.create という書き方ではなく user.create_brave という書き方になる
    create_brave!(default_brave_params)
  end

  private

  # 勇者の初期ステータス
  def default_brave_params
    {
      name: 'ゆうしゃ',
      exp: 0,
      level: 1,
      max_hp: 15,
      offense: 10,
      defense: 10
    }
  end

end
