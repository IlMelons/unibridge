if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")

ResourceFinder = {}

---@description Supported Framework List
Frameworks = {
    {name = "esx", resource = "es_extended"},
    {name = "qb", resource = "qb-core"},
    {name = "nd", resource = "ND_Core"},
    {name = "qbx", resource = "qbx_core"},
    {name = "ox", resource = "ox_core"},
}

---@description Supported Target List
Targets = {
    {name = "qb", resource = "qb-target"},
    {name = "ox", resource = "ox_target"},
}

---@description Supported Inventory List
Inventories = {
    {name = "qb", resource = "qb-inventory"},
    {name = "ox", resource = "ox_inventory"},
}

---@description Auto-Detect Framework Function
for i = 1, #Frameworks do
    local frameworkName, frameworkFolder = Frameworks[i].name, Frameworks[i].resource
    
    if (Config.Framework == "auto" and GetResourceState(frameworkFolder) == "started") or Config.Framework == frameworkName then
        ResourceFinder.Framework = frameworkName
        break
    end
end

---@description Auto-Detect Target Function
for i = 1, #Targets do
    local targetName, targetFolder = Targets[i].name, Targets[i].resource
    
    if (Config.Target == "auto" and GetResourceState(targetFolder) == "started") or Config.Target == (target or targetLabel) then
        ResourceFinder.Target = targetName
        break
    end
end

---@description Auto-Detect Inventory Function
for i = 1, #Inventories do
    local inventoryName, inventoryFolder = Inventories[i].name, Inventories[i].resource
    
    if (Config.Inventory == "auto" and GetResourceState(inventoryFolder) == "started") or Config.Inventory == inventoryName then
        ResourceFinder.Inventory = inventoryName
        break
    end
end

---@description Debug Functions - Do Not Remove
lib.print.debug("Framework Set/Found: "..ResourceFinder.Framework)
lib.print.debug("Target Set/Found: "..ResourceFinder.Target)
lib.print.debug("Inventory Set/Found: "..ResourceFinder.Inventory)