class Monster < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :image, presence: true
  validates :recommended_level, presence: true
  validates :max_hp, presence: true
  validates :offense, presence: true
  validates :defense, presence: true
  validates :exp, presence: true

  attr_accessor :hp, :damage

  # sessionに保存するデータ（戦闘中に必要となるデータ）を作成するメソッド
  def session_attributes
    attributes.slice('name', 'offense', 'defense', 'exp').merge('hp' => self.max_hp)
  end

  include Calculation

  def attack(brave)
    brave.hp -= brave.damage = damage_calc(attacker: self, defender: brave)
    # HPが0以下にならないようにする
    brave.hp = 0 if brave.hp < 0
  end

end
