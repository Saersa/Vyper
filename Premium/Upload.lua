local HttpService = game:GetService("HttpService")
local url = "https://exploitingguest.exploitingguest.workers.dev/api/users"

local payload = {
    userID = game.Players.LocalPlayer.UserId,         -- optional; try using a real userID from your DB
    username = game.Players.LocalPlayer.Name,    -- the username you want to upload/update
    Fingerprint = game.JobId,   -- optional
    Premium = getgenv().LoalcalPremoiumLoaderTrueREalANebvleV2            -- optional (boolean/string/1 also accepted)
}

local ok, res = pcall(function()
    return request({
        Url = url,
        Method = "POST",
        Body = HttpService:JSONEncode(payload),
        Headers = { ["Content-Type"] = "application/json" }
    })
end)


