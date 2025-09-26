repeat
    task.wait(0.1)
until game:IsLoaded()

local plr = game.Players.LocalPlayer
local Char = plr.Character or plr.CharacterAdded:Wait()
local convert = {
    ["1"] = "One",
    ["2"] = "Two",
    ["3"] = "Three",
    ["4"] = "Four",
    ["5"] = "Five",
    ["6"] = "Six",
    ["7"] = "Seven",
    ["8"] = "Eight",
    ["9"] = "Nine",
    ["0"] = "Zero",
}


local isPremium = getgenv().LoalcalPremoiumLoaderTrueREalANebvleV2
local isFree = getgenv().keysysetmfortyhefreebiesiscompeltedV2

local WindUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/Saersa/EGH_2.0/refs/heads/main/WINDUI_Custom.lua"))()
local WindUI_Themes = {}
for i in pairs(WindUI.Themes) do
	table.insert(WindUI_Themes,i)
end
table.sort(WindUI_Themes)






local Window = WindUI:CreateWindow({
    Title = "ExploitingGuest",
    Icon = "accessibility", -- lucide icon
    Author = "by ExploitingGuest",
    Folder = "EGH_V2",
    
    Size = UDim2.fromOffset(580, 460),
    MinSize = Vector2.new(560, 350),
    MaxSize = Vector2.new(850, 560),
    Transparent = true,
    Theme = "Dark",
    Resizable = true,
    SideBarWidth = 150,
    BackgroundImageTransparency = 0.42,
    HideSearchBar = true,
    ScrollBarEnabled = false,

    User = {
        Enabled = true,

        Anonymous = false,

        DisplayName = (function()
            if plr.DisplayName == plr.Name then
                return "Anonymous"
            else
                local FirstLetter = plr.DisplayName:sub(0, 1)
				local AnotherPart = plr.DisplayName:sub(- (#plr.DisplayName - 1))

				return string.upper(FirstLetter) .. AnotherPart
            end
        end)(),

        Name = (function()
            local Name = plr.Name
            local MaxLength = math.ceil(#Name * 0.5) -- keep first half
            local NoTagsName = Name:sub(1, MaxLength)
            return NoTagsName .. string.rep("*", #Name - MaxLength)
        end)(),

        Callback = function()
            
        end,
    }
})
WindUI:ToggleAcrylic(true)

Window:Tag({
    Title = isPremium and "\u{1F451} Premium" or "Freemium",
    Color = isPremium and Color3.fromHex("#efff40") or Color3.fromHex("#ff0000"),
    Radius = 13, -- from 0 to 13
})

Window:Tag({
    Title = "v2.0.0",
    Color = Color3.fromHex("#30ff6a"),
    Radius = 13, -- from 0 to 13
})




local Tabs = {}

Tabs.Home           = Window:Tab({Title = "Home", Icon = "house", Locked = false})
Tabs.LocalPlayer    = Window:Tab({Title = "Local Player", Icon = "user", Locked = false})
Tabs.Farm           = Window:Tab({Title = "Farm", Icon = "tractor", Locked = false})
Tabs.Combat         = Window:Tab({Title = "Combat", Icon = "swords", Locked = false})
Tabs.Stun           = Window:Tab({Title = "Stun", Icon = "zap-off", Locked = false})
Tabs.Teleport       = Window:Tab({Title = "Teleport", Icon = "map-pin", Locked = false})

Tabs.Alts       = Window:Tab({Title = "\u{1F451} Alts ", Icon = "map-pin", Locked = not (isPremium and not isFree)})


Tabs.Sections = {}
Tabs.Sections.Misc  = Window:Section({Title = "Misc", Icon = "chart-spline", Opened = false})
Tabs.Animations     = Tabs.Sections.Misc:Tab({Title = "Animations", Icon = "chart-spline", Locked = false})
Tabs.RandomStuff     = Tabs.Sections.Misc:Tab({Title = "Random Stuff", Icon = "door-open", Locked = false})
Tabs.Settings       = Window:Tab({Title = "Settings", Icon = "settings", Locked = false})



--// LocalPlayer
--workspace.Live.tyf6uj7yt6uhytujdx.JumpPowerAmount
--game.Players.LocalPlayer.Character.ExtraSpeed.Value = 1


--[[//

Kill Farm
-----------------------------------
> Method 1
Autodetect player iframes, below certain health. nuke with deku v1's 1
-----------------------------------
> Method 2 
M1 spam + Moves
-----------------------------------
> Select Players to whitelist
> More

-----------------------------------
Namu Autofarm
-----------------------------------
> Use bakugo 
> workspace.Live.Nomu.IFrame
]]




--// Alts







--// Animations
local JerkSpeed = 0.65
local CustomAnimSpeed = 0.65
local CustomAnimID = nil

Tabs.Animations:Section({ 
    Title = "[TIP] Disable Auto-Use in settings!",
    TextXAlignment = "Left",
    TextSize = 17, 
})

Tabs.Animations:Slider({
    Title = "Jerk Speed",
    Step = 0.1,
    
    Value = {
        Min = 0.1,
        Max = 10.0,
        Default = 0.6,
    },
    Callback = function(value)
       JerkSpeed = value
    end
})


 
Tabs.Animations:Button({
    Title = "Jerk",
    Desc = "",
    Locked = false,
    Callback = function()
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    
        local backpack = game.Players.LocalPlayer:FindFirstChildWhichIsA("Backpack")
        if not humanoid or not backpack then return end

        local tool = Instance.new("Tool")
        tool.Name = "Jerk Off"
        tool.ToolTip = "in the stripped club. straight up \"jorking it\" . and by \"it\" , haha, well. let's justr say. My peanits."
        tool.RequiresHandle = false
        tool.Parent = backpack

        local jorkin = false
        local track = nil

        local function stopTomfoolery()
            jorkin = false
            if track then
                track:Stop()
                track = nil
            end
        end

        tool.Equipped:Connect(function() jorkin = true end)
        tool.Unequipped:Connect(stopTomfoolery)
        humanoid.Died:Connect(stopTomfoolery)

        while task.wait() do
            if not jorkin then continue end

            if not track then
                local anim = Instance.new("Animation")
                anim.AnimationId = "rbxassetid://72042024"
                track = humanoid:LoadAnimation(anim)
            end
            
            track:Play()
            track:AdjustSpeed(JerkSpeed)
            track.TimePosition = 0.6
            task.wait()
            while track and track.TimePosition < (0.7) do task.wait() end
            if track then
                track:Stop()
                track = nil
            end
        end
    end
})


Tabs.Animations:Button({
    Title = "Salute",
    Desc = "",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
        local backpack = player:FindFirstChildWhichIsA("Backpack")
        if not humanoid or not backpack then return end

        local tool = Instance.new("Tool")
        tool.Name = "Salute"
        tool.RequiresHandle = false
        tool.Parent = backpack

        local track
        local Salute = false
        local animId = "rbxassetid://65067813" -- your animation

        local function startAnimation()
            if not track then
                local anim = Instance.new("Animation")
                anim.AnimationId = animId
                track = humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = false
                track:Play()
                track.TimePosition = 0.2           -- freeze at the middle
                track:AdjustSpeed(0.00001)           -- tiny speed to "freeze"
            end
        end

        local function stopAnimation()
            if track then
                track:Stop()
                track = nil
            end
        end

        tool.Equipped:Connect(function() 
            Salute = true
            startAnimation()
        end)

        tool.Unequipped:Connect(function()
            Salute = false
            stopAnimation()
        end)

        humanoid.Died:Connect(stopAnimation)
    end
})


Tabs.Animations:Button({
    Title = "Sit",
    Desc = "",
    Locked = false,
    Callback = function()
        local player = game.Players.LocalPlayer
        local char = player.Character or player.CharacterAdded:Wait()
        local humanoid = char:FindFirstChildWhichIsA("Humanoid")
        local backpack = player:FindFirstChildWhichIsA("Backpack")
        if not humanoid or not backpack then return end

        local tool = Instance.new("Tool")
        tool.Name = "Sit"
        tool.RequiresHandle = false
        tool.Parent = backpack

        local track
        local Sit = false
        local animId = "rbxassetid://179224234" -- your animation

        local function startAnimation()
            if not track then
                local anim = Instance.new("Animation")
                anim.AnimationId = animId
                track = humanoid:LoadAnimation(anim)
                track.Priority = Enum.AnimationPriority.Action
                track.Looped = true
                track:Play()
                          -- freeze at the middle
                track:AdjustSpeed(0)           -- tiny speed to "freeze"
            end
        end

        local function stopAnimation()
            if track then
                track:Stop()
                track = nil
            end
        end

        tool.Equipped:Connect(function() 
            Salute = true
            startAnimation()
        end)

        tool.Unequipped:Connect(function()
            Salute = false
            stopAnimation()
        end)

        humanoid.Died:Connect(stopAnimation)
    end
})



local Section = Tabs.Animations:Section({ 
    Title = "Custom Animations (Only Static for now)",
    TextXAlignment = "Left",
    TextSize = 17,
})
--[[
Tabs.Animations:Slider({
    Title = "Custom Animation Speed",
    Step = 0.1,
    
    Value = {
        Min = 0,
        Max = 10.0,
        Default = 0.6,
    },
    Callback = function(value)
       CustomAnimSpeed = value
    end
})]]


Tabs.Animations:Input({
    Title = "Custom Animation",
    Desc = "Input your AnimationID",
    Value = "",
    --InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "",
    Callback = function(input) 
        CustomAnimID = "rbxassetid://"..input
        
    end
})

Tabs.Animations:Button({
    Title = "Give Custom Animation",
    Desc = "Test Button",
    Locked = false,
    Callback = function()
        if CustomAnimID == nil then return end
        local humanoid = game.Players.LocalPlayer.Character:FindFirstChildWhichIsA("Humanoid")
    
        local backpack = game.Players.LocalPlayer:FindFirstChildWhichIsA("Backpack")
        if not humanoid or not backpack then return end

        local tool = Instance.new("Tool")
        tool.Name = "Custom Animation "
        tool.RequiresHandle = false
        tool.Parent = backpack

        local CustomAnim = false
        local track = nil

        local function stopTomfoolery()
            CustomAnim = false
            if track then
                track:Stop()
                track = nil
            end
        end

        tool.Equipped:Connect(function() CustomAnim = true end)
        tool.Unequipped:Connect(stopTomfoolery)
        humanoid.Died:Connect(stopTomfoolery)

        while task.wait() do
            if not CustomAnim then continue end

            if not track then
                local anim = Instance.new("Animation")
                anim.AnimationId = CustomAnimID
                track = humanoid:LoadAnimation(anim)
            end
            track.Looped = true
            track.Priority = Enum.AnimationPriority.Action
            track:Play(0, 99)
            if track then
                track:Stop(0)
                track = nil
            end
        end
    end
})






--//Random Stuff
Tabs.RandomStuff:Button({
    Title = "Remove Animations",
    Desc = "Removes animations by some dumb method. Must reset to fix\n FE. Except moves",
    Locked = false,
    Callback = function()
        local Humanoid = game.Players.LocalPlayer.Character.Humanoid
        local a = Humanoid:Clone()
        a.Parent = game:GetService("Lighting")
        Humanoid:Destroy()
        task.wait(0.1)
        a.Parent = game.Players.LocalPlayer.Character
    end
})





--//Settings

local ConfigManager = Window.ConfigManager
local myConfig = ConfigManager:CreateConfig("Heroes Battlegrounds")

Tabs.Settings:Input({
    Title = "Toggle UI",
    Desc = "Open/Close your UI",
    Value = "H",
    InputIcon = "bird",
    Type = "Input", -- or "Textarea"
    Placeholder = "H",
    Callback = function(input) 
        -- Normalize the input
        input = tostring(input)  -- ensure it's a string
        if convert[input] then
            input = convert[input]
        else
            -- Keep text as-is, but capitalize first letter if user typed "one"
            input = input:sub(1,1):upper() .. input:sub(2):lower()
        end

        local success, erroText = pcall(function()
            if Enum.KeyCode[input] then
                Window:SetToggleKey(Enum.KeyCode[input])
            else
                error("Invalid key: "..input)
            end
        end)

        if success then
            print("[EGH V2] Opening keybind is now "..input)
        else
            WindUI:Notify({
                Title = "Failed to change keybind",
                Content = "Error: " .. tostring(erroText),
                Duration = 10,
            })
        end
    end
})


Tabs.Settings:Dropdown({
    Title = "Theme Selector",
    Values = WindUI_Themes,
    Value = Window.Theme,
    Callback = function(option) 
        local success,erroText = pcall(function()
            WindUI:SetTheme(option)
            myConfig.Theme = option
        end)
        if success then
            WindUI:Notify({
					Title = "Your theme has changed",
					Content = "Theme has changed succesfully",
					Duration = 5,
				})
            else
                WindUI:Notify({
					Title = "Failed to swap theme",
					Content = "Error: " .. tostring(erroText),
					Duration = 10,
				})
        end
    end
})


myConfig:RegisterAll({Tabs = Tabs})
task.spawn(myConfig.Load)
myConfig.Data = myConfig.Data or {}
Tabs.Settings:Button({
		Title = "Save Actual Config",
		Desc = "The next time you run this script the current config will be set.",
		Callback = function()
			local Succes, ErrorText = pcall(myConfig.Save)
			if Succes then
				WindUI:Notify({
					Title = "Actual Config Saved",
					Content = "Your actual config was saved correctly",
					Duration = 10,
				})
			else
				WindUI:Notify({
					Title = "Failed to Save actual Config",
					Content = "Error: " .. tostring(ErrorText),
					Duration = 10,
				})
			end
		end
})

local data = myConfig:GetData()
local themeSelector = data.elements.Settings_Dropdown_ThemeSelector.Value
WindUI:SetTheme(themeSelector)












-- Namu: workspace.Live.Nomu / workspace.Live.Nomu.HumanoidRootPart / workspace.Live.Nomu.Humanoid
-- child added : workspace.Live if its Nomu then do something idfk