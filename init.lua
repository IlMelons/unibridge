--- ONLY TESTING THIS
if GetResourceState("ox_lib") ~= "started" then return lib.print.error("[ERROR]: ox_lib not found, unable to continue") end

uni = {}
local ResourceFinder = lib.load("shared/autodetect")
local context = IsDuplicityVersion() and "server" or "client"

---@description Dinamic Loading Function
function LoadModule(category, resourceName)
    local path = ("%s/%s/%s.lua"):format(context, category, resourceName)
    local chunk = LoadResourceFile(GetCurrentResourceName(), path)
    if not chunk then
        print(("[ERROR]: Could not load module for category '%s' and resource '%s'"):format(category, resourceName))
        return {}
    end
    local fn, err = load(chunk, ("@@%s/%s"):format(GetCurrentResourceName(), path))
    if not fn or err then
        print(("[ERROR]: Error executing module '%s': %s"):format(path, err))
        return {}
    end
    local env = setmetatable({}, { __index = _G })
    setfenv(fn, env)
    fn()
    return env
end

local SelectedModules = {}
for category, resourceName in pairs(ResourceFinder) do
    if resourceName then
        SelectedModules[category] = LoadModule(category, resourceName)
    else
        SelectedModules[category] = {}
        print(("[WARNING]: No resource found for category '%s'"):format(category))
    end
end

function uni.call(functionName, ...)
    for category, module in pairs(SelectedModules) do
        if module[functionName] then
            return module[functionName](...)
        end
    end
    print(("[ERROR]: Function '%s' not found in any loaded module"):format(functionName))
end

---@description Debugging part for loaded modules
for category, module in pairs(SelectedModules) do
    lib.print.debug(("Loaded module for category '%s': %s"):format(category, module and "Success" or "Failed"))
end