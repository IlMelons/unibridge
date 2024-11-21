if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")
Supported = lib.load("supported")

function DetectResource(configKey, resourceList)
    local resources = Supported[resourceList]
    for i = 1, #resources do
        local resourceName, resourceFolder = resources[i].name, resources[i].resource
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