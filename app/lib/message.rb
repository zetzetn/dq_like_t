class Message
  class << self
    def level_up(brave)
      "#{brave.name} のレベルが #{brave.level} にあがった！"
    end
    
    def start(monster)
      "#{monster.name} があらわれた！"
    end

    def damage(attacker:, defender:)
      [
        "#{attacker.name} のこうげき！",
        "#{defender.name} に #{defender.damage} のダメージ！"
      ]
    end

    def victory(monster)
      [
        "#{monster.name} をたおした！",
        "#{monster.exp} のけいけんちをかくとく！"
      ]
    end

    def defeat(brave)
      "#{brave.name} はちからつきた……"
    end
    
  end
end