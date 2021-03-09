Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  #chaser server actions
  post "clientHello" => "server#clientHello" #Chaserクライアント接続処理 body(roomToken,name,CorH) return(battleToken)
  post "clientRequest" => "server#clientRequest" #Chaserクライアント行動処理 body(battleToken,cmd) return(values)

  
  #token manage server actions
  get "tokenGet" => "token#tokenGet" #トークン発行処理(roomToken,battleTokenの発行) return(roomToken)
  get "tokenAll" => "token#tokenAll" #トークン一覧(デベロップ用)
  get "tokenDel" => "token#tokenDel" #トークン一括削除(デベロップ用)

  #chaser manage server actions


  #chaser view server actions


end
