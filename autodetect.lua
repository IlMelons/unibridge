if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")
Supported = lib.load("supported")

function DetectResource(category)
    local resources = Supported[category]
    for i = 1, #resources do
        local resourceName, resourceFolder = resources[i].name, resources[i].resource
        if (Config[category] == "auto" and GetResourceState(resourceFolder) == "started") or Config[category] == resourceName then
            return resourceName
        end
    end
    return nil
end

ResourceFinder = {}

ResourceFinder.Framework = DetectResource("Framework")
ResourceFinder.Target = DetectResource("Target")
ResourceFinder.Inventory = DetectResource("Inventory")

---@description Debug Functions - Do Not Remove
lib.print.debug("Framework Set/Found: "..ResourceFinder.Framework)
lib.print.debug("Target Set/Found: "..ResourceFinder.Target)
lib.print.debug("Inventory Set/Found: "..ResourceFinder.Inventory)