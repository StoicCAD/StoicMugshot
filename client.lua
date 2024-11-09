RegisterNetEvent("createNotification")
AddEventHandler("createNotification", function(data)
    -- Trigger the notification using lib.notify
    lib.notify({
        id = data.id or nil,
        title = data.title or '',
        description = data.description or '',
        duration = data.duration or nil,
        position = data.position or 'top',
        type = data.type or 'inform',
        style = data.style or {},
        icon = data.icon or nil,
        iconColor = data.iconColor or nil,
        iconAnimation = data.iconAnimation or nil,
        alignIcon = data.alignIcon or 'center'
    })
end)

RegisterCommand("mugshot", function()
    local playerPed = GetPlayerPed(-1)
    local mugShot = exports["MugShotBase64"]:GetMugShotBase64(playerPed, true)
    if mugShot then
        TriggerServerEvent("saveMugshot", mugShot)
        -- Trigger a notification after successfully sending the mugshot
        TriggerEvent("createNotification", {
            title = "Mugshot Sent",
            description = "Your mugshot has been sent to the server for saving.",
            type = "success"
        })
    else
        -- Trigger a notification if unable to capture mugshot
        TriggerEvent("createNotification", {
            title = "Error",
            description = "Unable to capture mugshot.",
            type = "error"
        })
    end
end, false)


