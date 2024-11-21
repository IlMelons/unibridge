if GetResourceState("ox_lib") ~= "started" then return print("[ERROR]: ox_lib not found, unable to continue") end

Config = lib.load("config")
Supported = lib.load("supported")

---@param category string
---@return string
---@description ResourceDetection Function for each category
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

---@description Main Loop with caching (for framework functions toggle) and debugging (for framework selected)
ResourceFinder = {}
for category, _ in pairs(Supported) do
    local detectedResource = DetectResource(category)
    ResourceFinder[category] = detectedResource
    lib.print.debug(category.." Set/Found: "..(detectedResource or "Not Found"))
end