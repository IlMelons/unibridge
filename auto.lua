if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")
ResourceFinder = {}

---@description Auto-Detect Framework Function
if (Config.Framework == "auto" and GetResourceState("es_extended") == "started") or Config.Framework == "esx" then
    ResourceFinder.Framework = "esx"
elseif (Config.Framework == "auto" and GetResourceState("qb-core") == "started") or Config.Framework == "qb" then
    ResourceFinder.Framework = "qb"
elseif (Config.Framework == "auto" and GetResourceState("qbx_core") == "started") or Config.Framework == "qbx" then
    ResourceFinder.Framework = "qbx"
elseif (Config.Framework == "auto" and GetResourceState("ox_core") == "started") or Config.Framework == "ox" then
    ResourceFinder.Framework = "ox"
else
    ResourceFinder.Framework = "notfound"
end

---@description Auto-Detect Target Function
if (Config.Target == "auto" and GetResourceState("ox_target") == "started") or Config.Target == "ox" then
    ResourceFinder.Target = "ox"
elseif (Config.Target == "auto" and GetResourceState("qb-target") == "started") or Config.Target == "qb" then
    ResourceFinder.Target = "qb"
else
    ResourceFinder.Target = "notfound"
end

---@description Auto-Detect Inventory Function
if (Config.Inventory == "auto" and GetResourceState("ox_inventory") == "started") or Config.Inventory == "ox" then
    ResourceFinder.Inventory = "ox"
elseif (Config.Inventory == "auto" and GetResourceState("qb-inventory") == "started") or Config.Inventory == "qb" then
    ResourceFinder.Inventory = "qb"
else
    ResourceFinder.Inventory = "notfound"
end


---@description Debug Functions - Do Not Remove
lib.print.debug("Framework Set/Found: "..ResourceFinder.Framework)
lib.print.debug("Target Set/Found: "..ResourceFinder.Target)
lib.print.debug("Inventory Set/Found: "..ResourceFinder.Inventory)