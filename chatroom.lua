--chatroom




local ImGui = loadstring(game:HttpGet('https://github.com/depthso/Roblox-ImGUI/raw/main/ImGui.lua'))()
if getgenv().chatloaded then return end
local WebSocket = WebSocket.connect("wss://chatscript.pl4yr.org/chat")

--// Window 
getgenv().chatloaded = true
local Window = ImGui:CreateWindow({
	Title = "Playr's Chatroom",
	Size = UDim2.new(0, 350, 0, 370),
	Position = UDim2.new(0.5, 0, 0, 70)
})
Window:Center()
print(Window.Name)

local ConsoleTab = Window:CreateTab({
	Name = "Console"
})

Window:ShowTab(ConsoleTab) 

local Row2 = ConsoleTab:Row()

ConsoleTab:Separator({
	Text = "Chat"
})

local Console = ConsoleTab:Console({
	ReadOnly = true,
	LineNumbers = false,
	Border = false,
	Fill = true,
	Enabled = true,
	AutoScroll = true,
	RichText = true,
	MaxLines = 50
})

Row2:Button({
	Text = "Clear",
	Callback = Console.Clear
})
local banana = ""
local aea = game:GetService("Players").LocalPlayer.Name
Row2:Button({
	Text = "Send",
    Callback = function(self, Value)
        WebSocket:Send("[".. game.PlaceId .."] [" .. aea .. "] " .. banana)
    end,
})

Row2:InputText({
	PlaceHolder = "Input",
    Text = "",
    Callback = function(self, Value)
        banana = Value
    end,
})
WebSocket.OnMessage:Connect(function(Msg)
    Console:AppendText(Msg)
end)
WebSocket.OnClose:Connect(function(val)
    Console:AppendText("connection closed :(")
end)