local notify = {}

function notify.notify(data)
    lib.notify({
        title = data.title,
        description = data.message,
        type = data.type,
        duration = data.duration or 3000,
        position = data.position or "top",
    })
end

return notify