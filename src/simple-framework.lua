local root = {}
local run_service = game:GetService("RunService")
local systems = {}
root["get-system"] = function(name)
  if systems[name] then
    return systems[name]
  else
    return warn(("System with name " .. name .. " not found!"))
  end
end
root["setup-systems"] = function(directory)
  systems = {}
  for _, child in ipairs(directory:GetChildren()) do
    if child:IsA("ModuleScript") then
      local system = require(child)
      if system["on-setup"] then
        system["on-setup"]()
      else
      end
      systems[child.Name] = system
    else
    end
  end
  return nil
end
root.start = function()
  for _, system in ipairs(systems) do
    if system["on-start"] then
      system["on-start"]()
    else
    end
    if system["on-update"] then
      system["update-connection"] = (run_service.RenderStepped):Connect(system["on-update"])
    else
    end
  end
  return nil
end
root.stop = function()
  for _, system in ipairs(systems) do
    if system["on-stop"] then
      system["on-stop"]()
    else
    end
    if system["on-update"] then
      do end (system["update-connection"]):Disconnect()
    else
    end
  end
  return nil
end
return root
