local HttpService = game:GetService("HttpService")
local url = "https://exploitingguest.exploitingguest.workers.dev/api/users" -- lowercase + protocol

getgenv().EGHUsers = {}

local ok, res = pcall(function()
    return request({
        Url = url,
        Method = "GET",
    })
end)


if not ok then
rconsoleclear()
    rconsoleprint("\nrequest() failed: " .. tostring(res) .. "\n")
    return
end

local body = (type(res) == "table" and res.Body) or tostring(res)

local success, decoded_or_err = pcall(function() return HttpService:JSONDecode(body) end)
if not success then
rconsoleclear()
    rconsoleprint("\nFailed to decode JSON: "..tostring(decoded_or_err).."\n")
    return
end


local User = decoded_or_err[1]
local Premium = tonumber(User.Premium)


getgenv().EGHUsers = {} 

for _, User in ipairs(decoded_or_err) do
    local premiumNum = tonumber(User.Premium) or 0  -- convert string to number, default 0
    local isPremium = premiumNum > 0                -- true only if > 0

    table.insert(getgenv().EGHUsers, {
        Name = tostring(User.Username),
        UserID = tonumber(User.userID),
        Fingerprint = tostring(User.Fingerprint),
        Premium = isPremium
    })
end



for _, plr in pairs(game.Players:GetPlayers()) do
    local found = false
    for _, user in ipairs(getgenv().EGHUsers) do
        if user.UserID == plr.UserId then
            found = true
        end
    end
end




