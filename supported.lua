return {
    ---@description Supported Frameworks
    Frameworks = {
        {name = "esx", resource = "es_extended"},
        {name = "qbx", resource = "qbx_core"},
        {name = "qb", resource = "qb-core"},
        {name = "nd", resource = "ND_Core"},
        {name = "ox", resource = "ox_core"},
    }
    ---@description Supported Targets
    Targets = {
        {name = "ox", resource = "ox_target"},
        {name = "qb", resource = "qb-target"},
    }
    ---@description Supported Inventories
    Inventories = {
        {name = "ox", resource = "ox_inventory"},
        {name = "qb", resource = "qb-inventory"},
    }
}