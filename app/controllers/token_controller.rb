class TokenController < ApplicationController

  def tokenGet
    
    #TokenDB[room:text,battleHot:text,battleCool:text]
    
    source = [('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    #作成済みトークンのリスト
    createdRoomTokens = Token.all.pluck(:room)
    
    #トークンの生成(被らないように)
    while true

      @roomToken = (0...8).map { source[rand(source.length)] }.join
      
      #被っているトークンが無ければ
      if not createdRoomTokens.include?(@roomToken)

        #対戦用トークンの生成
        battleHotToken = @roomToken + (0...7).map { source[rand(source.length)] }.join
        battleCoolToken = @roomToken + (0...8).map { source[rand(source.length)] }.join
        
        #トークンをデータベースに追加
        token = Token.new(room:@roomToken,battleHot:battleHotToken,battleCool:battleCoolToken)
        token.save
        
        break
      end
    end
  end

  def tokenAll
    @tokenAll = Token.all
  end

  def tokenDel
    Token.destroy_all
    redirect_to "/tokenAll"
  end

end
