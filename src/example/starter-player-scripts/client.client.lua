local replicated_storage = game:GetService("ReplicatedStorage")
local players = game:GetService("Players")
local starter_player = game:GetService("StarterPlayer")
local starter_player_scripts = starter_player:WaitForChild("StarterPlayerScripts")
local libraries = replicated_storage:WaitForChild("libraries")
local simple_framework = require(libraries:WaitForChild("simple-framework"))
local player = players.LocalPlayer
local character = (player.Character or (player.CharacterAdded):Wait())
local systems = starter_player_scripts:WaitForChild("systems")
local function main()
  simple_framework["setup-systems"](systems:GetChildren())
  return simple_framework.start()
end
return main()
