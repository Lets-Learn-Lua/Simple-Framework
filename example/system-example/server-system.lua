-- Start by creaing a table, just like any other module script would!
local system = {} -- I called my table "system"

-- Then we want to grab ReplicatedStorage.
local replicated_storage = game:GetService("ReplicatedStorage")

-- Next we require the Simple-Framework module, point to where ever you placed yours.
-- I put mine inside a folder called "libraries" inside of ReplicatedStorage
local libraries = replicated_storage:WaitForChild("libraries")
local simple_framework = require(libraries:WaitForChild("simple-framework"))

-- Heres out first lifetime function, this runs whenever the system is being setup!
function system.on_setup()
  return print("This runs when the system is setup!")
end

-- We also have on_start() which runs whenever Simple-Framework is started!
-- You can also see we use the get_system() function here!
-- NOTE: You can only get systems AFTER they have been setup!
function system.on_start()
  print("This runs when the system is started!")
  print("The code below will get another system by name, if it exists")
  
  -- Heres the get_sytem() function I mentioned above!
  simple_framework.get_system("system-name")
end

-- This lifetime function runs every RenderStep and passes the delta time. 
function system.on_update(delta_time)
  return print("Lastly, this runs every frame. It also passes delta time.")
end

-- Lastly you want to return the table you created at the top of the script!
return system