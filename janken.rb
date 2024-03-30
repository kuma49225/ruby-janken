def janken(user_input, computer_input)
   puts "ホイ！"
   hands = ["グー", "チョキ", "パー"]
   puts " あなた：#{hands[user_input]}を出しました"
   puts " 相手：#{hands[computer_input]}を出しました"
end
 
 def janken_judge(user_input, computer_input)
   result = (user_input - computer_input + 3) % 3
   case result
   when 0
     puts "あいこ"
     return :draw
   when 1
     puts "あなたの負け"
     return :lose
   when 2
     puts "あなたの勝ち"
     return :win
   end
 end
 
 def acchimuitehoi()
   directions = ["上", "下", "左", "右"]
   puts "あっち向いて〜"
   puts "0(上) 1(下) 2(左) 3(右)"
   user_direction = gets.chomp.to_i
   unless [0, 1, 2, 3].include?(user_direction)
      puts "無効な入力です。0から3の数字を入力してください。"
      return acchimuitehoi()
   end
   computer_direction = rand(4)
   puts "あなた：#{directions[user_direction]}, 相手：#{directions[computer_direction]}"
   return user_direction, computer_direction 
 end
 
loop do
   puts "じゃんけん．．．"
   puts "0(グー) 1(チョキ) 2(パー) 3(戦わない)"
   user_input = gets.chomp.to_i
 
   if user_input == 3
     puts "終了します"
     break
   elsif (user_input == 0 || user_input == 1 || user_input == 2)
     computer_input = rand(3)
     janken(user_input, computer_input)
     janken_result = janken_judge(user_input, computer_input)
 
     if janken_result == :draw
       next
     elsif janken_result == :win
      user_direction, computer_direction = acchimuitehoi()
       if user_direction == computer_direction
         puts "あなたの勝ち！"
       break
       else
         puts "残念！もう一度じゃんけんを行います。"
         next
       end
     elsif janken_result == :lose
       user_direction, computer_direction = acchimuitehoi()
       if user_direction == computer_direction
         puts "あなたの負け！"
         break
       else
         puts "もう一度じゃんけんを行います。"
         next
       end
     end
   else
     puts "無効な入力です、もう一度入力してください"
   end
 end
   
  