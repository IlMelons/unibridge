if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")

---@description Supported Resources List
Frameworks = {
    {name = "esx", resource = "es_extended"},
    {name = "qbx", resource = "qbx_core"},
    {name = "qb", resource = "qb-core"},
    {name = "nd", resource = "ND_Core"},
    {name = "ox", resource = "ox_core"},
}
Targets = {
    {name = "ox", resource = "ox_target"},
    {name = "qb", resource = "qb-target"},
}
Inventories = {
    {name = "ox", resource = "ox_inventory"},
    {name = "qb", resource = "qb-inventory"},
}

function DetectResource(configKey, resourceList)
    for i = 1, #resourceList do
        local resourceName, resourceFolder = resourceList[i].name, resourceList[i].resource
        if (Config[configKey] == "auto" and GetResourceState(resourceFolder) == "started") or Config[configKey] == resourceName then
            return resourceName
        end
    end
    return nil
end

ResourceFinder = {}

ResourceFinder.Framework = DetectResource("Framework", Frameworks)
ResourceFinder.Target = DetectResource("Target", Targets)
ResourceFinder.Inventory = DetectResource("Inventory", Inventories)

---@description Debug Functions - Do Not Remove
lib.print.debug("Framework Set/Found: "..ResourceFinder.Framework)
lib.print.debug("Target Set/Found: "..ResourceFinder.Target)
lib.print.debug("Inventory Set/Found: "..ResourceFinder.Inventory)