-- Instances: 35 | Scripts: 0 | Modules: 0
local G2L = {};
local searchFocused = false
--#region instances
-- StarterGui.SynXConsole
G2L["1"] = Instance.new("ScreenGui", game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"));
G2L["1"]["Name"] = [[SynXConsole]];
G2L["1"]["ZIndexBehavior"] = Enum.ZIndexBehavior.Sibling;
G2L["1"].Enabled = false

-- StarterGui.SynXConsole.MainConsole
G2L["2"] = Instance.new("Frame", G2L["1"]);
G2L["2"]["BorderSizePixel"] = 0;
G2L["2"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
G2L["2"]["AnchorPoint"] = Vector2.new(0.5, 0.5);
G2L["2"]["Size"] = UDim2.new(0, 450, 0, 280);
G2L["2"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["2"]["Position"] = UDim2.new(0.5, 0, 0.5, 0);
G2L["2"]["Name"] = [[MainConsole]];
local guiSize = G2L["1"].AbsoluteSize
local xOffset = guiSize.X / 3.5
local yOffset = guiSize.Y / 3.5
G2L["2"].Position = UDim2.new(0, xOffset, 1, -yOffset)

-- StarterGui.SynXConsole.MainConsole.Topbar
G2L["3"] = Instance.new("Frame", G2L["2"]);
G2L["3"]["BorderSizePixel"] = 0;
G2L["3"]["BackgroundColor3"] = Color3.fromRGB(49, 49, 49);
G2L["3"]["Size"] = UDim2.new(1, 0, 0.10000000149011612, 0);
G2L["3"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["3"]["Name"] = [[Topbar]];
--#endregion
--#region dragging / gui toggle
local UserInputService = game:GetService("UserInputService")

local gui = G2L["3"]
local gui2 = G2L["2"]

local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    gui2.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

UserInputService.InputBegan:Connect(function(input,chat)
    if input.KeyCode == Enum.KeyCode.Insert then
        G2L["1"].Enabled = not G2L["1"].Enabled
    end
end)
gui.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = input.Position
        startPos = gui2.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

gui.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
--#endregion
--#region more instances
-- StarterGui.SynXConsole.MainConsole.Topbar.TextLabel
G2L["4"] = Instance.new("TextLabel", G2L["3"]);
G2L["4"]["BorderSizePixel"] = 0;
G2L["4"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["4"]["TextSize"] = 16;
G2L["4"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["4"]["Size"] = UDim2.new(1, 0, 1, 0);
G2L["4"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["4"]["Text"] = [[Console]];
G2L["4"]["BackgroundTransparency"] = 1;

-- StarterGui.SynXConsole.MainConsole.Topbar.TextLabel.UIPadding
G2L["5"] = Instance.new("UIPadding", G2L["4"]);
G2L["5"]["PaddingLeft"] = UDim.new(0, 8);

-- StarterGui.SynXConsole.MainConsole.Topbar.UICorner
G2L["6"] = Instance.new("UICorner", G2L["3"]);


-- StarterGui.SynXConsole.MainConsole.UICorner
G2L["7"] = Instance.new("UICorner", G2L["2"]);


-- StarterGui.SynXConsole.MainConsole.UIGradient
G2L["8"] = Instance.new("UIGradient", G2L["2"]);
G2L["8"]["Rotation"] = -90;
G2L["8"]["Color"] = ColorSequence.new{ColorSequenceKeypoint.new(0.000, Color3.fromRGB(226, 226, 226)),ColorSequenceKeypoint.new(0.189, Color3.fromRGB(183, 183, 183)),ColorSequenceKeypoint.new(0.306, Color3.fromRGB(183, 183, 183)),ColorSequenceKeypoint.new(0.391, Color3.fromRGB(174, 174, 174)),ColorSequenceKeypoint.new(0.602, Color3.fromRGB(189, 189, 189)),ColorSequenceKeypoint.new(0.891, Color3.fromRGB(255, 255, 255)),ColorSequenceKeypoint.new(1.000, Color3.fromRGB(255, 255, 255))};

-- StarterGui.SynXConsole.MainConsole.line
G2L["9"] = Instance.new("Frame", G2L["2"]);
G2L["9"]["BorderSizePixel"] = 0;
G2L["9"]["BackgroundColor3"] = Color3.fromRGB(159, 159, 159);
G2L["9"]["Size"] = UDim2.new(1, 0, 0.004999999888241291, 0);
G2L["9"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["9"]["Position"] = UDim2.new(0, 0, 0.800000011920929, 0);
G2L["9"]["Name"] = [[line]];

-- StarterGui.SynXConsole.MainConsole.OptionHolder
G2L["a"] = Instance.new("Frame", G2L["2"]);
G2L["a"]["BorderSizePixel"] = 0;
G2L["a"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["a"]["BackgroundTransparency"] = 1;
G2L["a"]["Size"] = UDim2.new(1, 0, 0.20000000298023224, 0);
G2L["a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["a"]["Position"] = UDim2.new(0, 0, 0.800000011920929, 0);
G2L["a"]["Name"] = [[OptionHolder]];

-- StarterGui.SynXConsole.MainConsole.OptionHolder.Search
G2L["b"] = Instance.new("TextBox", G2L["a"]);
G2L["b"]["CursorPosition"] = -1;
G2L["b"]["BorderSizePixel"] = 0;
G2L["b"]["TextSize"] = 16;
G2L["b"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["b"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["b"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["b"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["b"]["Size"] = UDim2.new(0.30000001192092896, 0, 0.6000000238418579, 0);
G2L["b"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["b"]["Text"] = [[search]];
G2L["b"]["Position"] = UDim2.new(0, 0, 0.05000000074505806, 0);
G2L["b"]["Name"] = [[Search]];


-- StarterGui.SynXConsole.MainConsole.OptionHolder.Search.UICorner
G2L["c"] = Instance.new("UICorner", G2L["b"]);
G2L["c"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.Search.UIPadding
G2L["d"] = Instance.new("UIPadding", G2L["b"]);
G2L["d"]["PaddingLeft"] = UDim.new(0, 8);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder
G2L["e"] = Instance.new("Frame", G2L["a"]);
G2L["e"]["BorderSizePixel"] = 0;
G2L["e"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["e"]["BackgroundTransparency"] = 1;
G2L["e"]["Size"] = UDim2.new(0.3499999940395355, 0, 0.6000000238418579, 0);
G2L["e"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["e"]["Position"] = UDim2.new(0.49000000953674316, 0, 0.05000000074505806, 0);
G2L["e"]["Name"] = [[RedirectionHolder]];

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder.TextLabel
G2L["f"] = Instance.new("TextLabel", G2L["e"]);
G2L["f"]["TextWrapped"] = true;
G2L["f"]["BorderSizePixel"] = 0;
G2L["f"]["RichText"] = true;
G2L["f"]["BackgroundColor3"] = Color3.fromRGB(77, 77, 77);
G2L["f"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["f"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["f"]["TextSize"] = 16;
G2L["f"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["f"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["f"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["f"]["Text"] = [[Output Redirection]];
G2L["f"]["BackgroundTransparency"] = 1;
G2L["f"]["Position"] = UDim2.new(0.20000000298023224, 0, 0, 0);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder.TextLabel.UICorner
G2L["10"] = Instance.new("UICorner", G2L["f"]);
G2L["10"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder.TextLabel.UIPadding
G2L["11"] = Instance.new("UIPadding", G2L["f"]);
G2L["11"]["PaddingLeft"] = UDim.new(0, 8);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder.ImageButton
G2L["12"] = Instance.new("ImageButton", G2L["e"]);
G2L["12"]["ZIndex"] = 3;
G2L["12"]["BorderSizePixel"] = 0;
G2L["12"]["ImageTransparency"] = 1;
G2L["12"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["12"]["Image"] = [[http://www.roblox.com/asset/?id=6972569034]];
G2L["12"]["Size"] = UDim2.new(0, 33, 0, 33);
G2L["12"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.RedirectionHolder.ImageButton.UICorner
G2L["13"] = Instance.new("UICorner", G2L["12"]);
G2L["13"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder
G2L["14"] = Instance.new("Frame", G2L["a"]);
G2L["14"]["BorderSizePixel"] = 0;
G2L["14"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["14"]["BackgroundTransparency"] = 1;
G2L["14"]["Size"] = UDim2.new(0.3499999940395355, 0, 0.6000000238418579, 0);
G2L["14"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["14"]["Position"] = UDim2.new(0.7400000095367432, 0, 0.05000000074505806, 0);
G2L["14"]["Name"] = [[AutoScrollHolder]];

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder.TextLabel
G2L["15"] = Instance.new("TextLabel", G2L["14"]);
G2L["15"]["TextWrapped"] = true;
G2L["15"]["BorderSizePixel"] = 0;
G2L["15"]["RichText"] = true;
G2L["15"]["BackgroundColor3"] = Color3.fromRGB(77, 77, 77);
G2L["15"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["15"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["15"]["TextSize"] = 16;
G2L["15"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["15"]["Size"] = UDim2.new(0.5, 0, 1, 0);
G2L["15"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["15"]["Text"] = [[AutoScroll]];
G2L["15"]["BackgroundTransparency"] = 1;
G2L["15"]["Position"] = UDim2.new(0.20000000298023224, 0, 0, 0);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder.TextLabel.UICorner
G2L["16"] = Instance.new("UICorner", G2L["15"]);
G2L["16"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder.TextLabel.UIPadding
G2L["17"] = Instance.new("UIPadding", G2L["15"]);
G2L["17"]["PaddingLeft"] = UDim.new(0, 8);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder.ImageButton
G2L["18"] = Instance.new("ImageButton", G2L["14"]);
G2L["18"]["ZIndex"] = 3;
G2L["18"]["BorderSizePixel"] = 0;
G2L["18"]["ImageTransparency"] = 1;
G2L["18"]["BackgroundColor3"] = Color3.fromRGB(27, 27, 27);
G2L["18"]["Image"] = [[http://www.roblox.com/asset/?id=6972569034]];
G2L["18"]["Size"] = UDim2.new(0, 33, 0, 33);
G2L["18"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.AutoScrollHolder.ImageButton.UICorner
G2L["19"] = Instance.new("UICorner", G2L["18"]);
G2L["19"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.Clear
G2L["1a"] = Instance.new("TextButton", G2L["a"]);
G2L["1a"]["BorderSizePixel"] = 0;
G2L["1a"]["BackgroundColor3"] = Color3.fromRGB(77, 77, 77);
G2L["1a"]["TextSize"] = 13;
G2L["1a"]["FontFace"] = Font.new([[rbxasset://fonts/families/GothamSSm.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["1a"]["TextColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1a"]["Size"] = UDim2.new(0.15000000596046448, 0, 0.6000000238418579, 0);
G2L["1a"]["Name"] = [[Clear]];
G2L["1a"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1a"]["Text"] = [[Clear]];
G2L["1a"]["Position"] = UDim2.new(0.3199999928474426, 0, 0.05000000074505806, 0);

-- StarterGui.SynXConsole.MainConsole.OptionHolder.Clear.UICorner
G2L["1b"] = Instance.new("UICorner", G2L["1a"]);
G2L["1b"]["CornerRadius"] = UDim.new(0, 4);

-- StarterGui.SynXConsole.MainConsole.ConsoleArea
G2L["1c"] = Instance.new("ScrollingFrame", G2L["2"]);
G2L["1c"]["Active"] = true;
G2L["1c"]["BorderSizePixel"] = 0;
G2L["1c"]["ScrollBarImageTransparency"] = 0;
G2L["1c"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["1c"]["BackgroundTransparency"] = 1;
G2L["1c"]["Size"] = UDim2.new(1, 0, 0.699999988079071, 0);
G2L["1c"]["ScrollBarImageColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["1c"]["Position"] = UDim2.new(0, 0, 0.10000000149011612, 0);
G2L["1c"]["Name"] = [[ConsoleArea]];
G2L["1c"]['CanvasSize'] = UDim2.new(0, 0, 0, 0);
G2L["1c"]["AutomaticCanvasSize"] = Enum.AutomaticSize.Y;
G2L["1c"]['ScrollBarThickness'] = 8

-- StarterGui.SynXConsole.MainConsole.ConsoleArea.UIListLayout
G2L["1d"] = Instance.new("UIListLayout", G2L["1c"]);
G2L["1d"]["SortOrder"] = Enum.SortOrder.LayoutOrder;

-- StarterGui.SynXConsole.MainConsole.ConsoleArea.Error
G2L["printText"] = Instance.new("TextLabel");
G2L["printText"]["TextWrapped"] = true;
G2L["printText"]["BorderSizePixel"] = 0;
G2L["printText"]["BackgroundColor3"] = Color3.fromRGB(255, 255, 255);
G2L["printText"]["TextXAlignment"] = Enum.TextXAlignment.Left;
G2L["printText"]["FontFace"] = Font.new([[rbxasset://fonts/families/SourceSansPro.json]], Enum.FontWeight.Regular, Enum.FontStyle.Normal);
G2L["printText"]["TextSize"] = 14;
G2L["printText"]["TextColor3"] = Color3.fromRGB(168, 0, 0);
G2L["printText"]["Size"] = UDim2.new(1, 0,0, 15);
G2L["printText"]["BorderColor3"] = Color3.fromRGB(0, 0, 0);
G2L["printText"]["Text"] = [[Expected (bitches) near Line 42 (did you forget to get any?)]];
G2L["printText"]["Name"] = [[Error]];
G2L["printText"]["BackgroundTransparency"] = 1;

-- StarterGui.SynXConsole.MainConsole.ConsoleArea.Warning.UIPadding
G2L["23"] = Instance.new("UIPadding", G2L["printText"]);
G2L["23"]["PaddingLeft"] = UDim.new(0, 8);
--#endregion

--#region main code
-- create text
local warningCol = Color3.fromRGB(255, 224, 61)
local printCol = Color3.fromRGB(255, 255,255)
local errorCol = Color3.fromRGB(168, 0, 0)

function createText(col,text)
    local newText = G2L["printText"]:Clone()
    newText.Parent = G2L['1c']
    newText["TextColor3"] = col;
    newText["Text"] = text;
end


local LogService = game:GetService("LogService")
local autoscroll = false
local redirection = false
G2L["18"].MouseButton1Down:Connect(function()
    autoscroll = not autoscroll
    if autoscroll then
        G2L["18"].ImageTransparency = 0
        G2L["1c"].CanvasPosition = Vector2.new(0,99999)
    else
        G2L["18"].ImageTransparency = 1
    end
end)

G2L["12"].MouseButton1Down:Connect(function()
    redirection = not redirection
    if redirection then
        G2L["12"].ImageTransparency = 0
    else
        G2L["12"].ImageTransparency = 1
    end
end)

G2L["1a"].MouseButton1Down:Connect(function()
    for i,v in pairs(G2L['1c']:GetChildren()) do
        if v:IsA"TextLabel" then
            v:Destroy()
        end
    end
    G2L["1c"].CanvasPosition = Vector2.new(0,99999)
end)

G2L["b"].Focused:Connect(function()
    searchFocused = true
end)
G2L["b"].FocusLost:Connect(function()
    searchFocused = false
    if autoscroll then
        G2L["1c"].CanvasPosition = Vector2.new(0,99999)
    end
end)
task.spawn(function()
    while task.wait() do
        if searchFocused then
            for i,v in pairs(G2L["1c"]:GetChildren()) do
                if v:IsA"TextLabel" then
                    if not v.Text:lower():find(G2L["b"].Text:lower()) then
                        v.Visible = false
                    else
                        v.Visible = true
                    end
                end
            end

        end

    end
end)


LogService.MessageOut:Connect(function(message, messageType)
    if messageType == Enum.MessageType.MessageOutput and redirection then -- 2 is warning
        createText(printCol,message)
        if autoscroll then
            G2L["1c"].CanvasPosition = Vector2.new(0,99999)
        end
    elseif messageType == Enum.MessageType.MessageWarning then -- 2 is warning
        if not redirection then
            if message ~= "" and message:sub(1, 1) == ':' then
                createText(warningCol,message)

                if autoscroll then
                    G2L["1c"].CanvasPosition = Vector2.new(0,99999)
                end

            end
    else
        createText(warningCol,message)
        if autoscroll then
            G2L["1c"].CanvasPosition = Vector2.new(0,99999)
        end
    end

    elseif messageType == Enum.MessageType.MessageError then -- 2 is warning
        createText(errorCol,message)
        if autoscroll then
            G2L["1c"].CanvasPosition = Vector2.new(0,99999)
        end
    end
end)
--#endregion

return G2L["1"], require;
