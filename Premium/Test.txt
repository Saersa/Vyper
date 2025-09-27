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
table.insert(getgenv().EGHUsers,{
	Name = tostring(User.Username),
	UserID = tonumber(User.userID),
	Fingerprint = tostring(User.Fingerprint),
	Premium = (Premium == 0 and false or true)
})
print("---------------------")
for i,v in pairs(EGHUsers) do
	for k,a in pairs(v) do
		print(k..":"..tostring(a))
	end
end
print("---------------------")

