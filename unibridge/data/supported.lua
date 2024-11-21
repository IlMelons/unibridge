return {
    ---@description Supported Frameworks
    Framework = {
        {name = "esx", resource = "es_extended"},
        {name = "qbx", resource = "qbx_core"},
        {name = "qb", resource = "qb-core"},
        {name = "nd", resource = "ND_Core"},
        {name = "ox", resource = "ox_core"},
    },
    ---@description Supported Targets
    Target = {
        {name = "ox", resource = "ox_target"},
        {name = "qb", resource = "qb-target"},
    },
    ---@description Supported Inventories
    Inventory = {
        {name = "ox", resource = "ox_inventory"},
        {name = "qb", resource = "qb-inventory"},
    },
}
