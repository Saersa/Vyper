local url = "https://raw.githubusercontent.com/Saersa/EGH_2.0/refs/heads/main/Games"

local games = {
	  [13076380114] = "HBG"; -- GameID, script name
      [3652625463] = "Lifting Simulator";
	
	
}

for i,v in next, games do
    games[i] = table.concat(v:split(' '), '_')
end

local name = games[game.PlaceId] or games[game.GameId]
return loadstring(game:HttpGet(url.. "/"..(name or "Universal")..".lua"))()
