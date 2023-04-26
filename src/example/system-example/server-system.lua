local system = {}
local replicated_storage = game:GetService("ReplicatedStorage")
local libraries = replicated_storage:WaitForChild("libraries")
local simple_framework = require(libraries:WaitForChild("simple-framework"))
system["on-setup"] = function()
  return print("This runs when the system is setup!")
end
system["on-start"] = function()
  print("This runs when the system is started!")
  print("The code below will get another system by name, if it exists")
  return simple_framework["get-system"]("system-name")
end
system["on-update"] = function(delta_time)
  return print("Lastly, this runs every frame. It also passes delta time.")
end
return system
