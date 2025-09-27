local HttpService = game:GetService("HttpService")
local base = "https://exploitingguest.exploitingguest.workers.dev/api/users"
local username = game.Players.LocalPlayer.Name

local url = base .. "?username=" .. HttpService:UrlEncode(username)

local ok, res = pcall(function()
  return request({
    Url = url,
    Method = "DELETE",
    Headers = { ["Content-Type"] = "application/json" } 
  })
end)

if not ok then
  warn("DELETE request failed:", res)
else
  local body = (type(res) == "table" and res.Body) or tostring(res)
  local success, parsed = pcall(function() return HttpService:JSONDecode(body) end)
  if success then
    print("DELETE response:", HttpService:JSONEncode(parsed))
  end
end
