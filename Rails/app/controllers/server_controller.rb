class ServerController < ApplicationController

  def clientHello
    roomToken = params[:roomToken]
    clientName = params[:name]
    clientColor= params[:color]
    
    #muchToken気に入らない

    #渡されたroomTokenと一致する最初のレコードを返却
    muchToken = Token.find_by(roomToken:roomToken)
    
    if muchToken == nil
      #渡されたroomTokenと一致するものがTokenデータベースに無ければ
    end
    



  end

end
