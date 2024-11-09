RegisterServerEvent("saveMugshot")
AddEventHandler("saveMugshot", function(mugShot)
    local player = NDCore.getPlayer(source)
    if not player then
        print("[SERVER] Player not found.")
        return
    end
    local charId = player.getData("id")
    if not charId then
        print("[SERVER] Unable to obtain character ID.")
        return
    end
    local query = "INSERT INTO `nd_characters` (charid, mugshot) VALUES (?, ?) ON DUPLICATE KEY UPDATE mugshot = VALUES(mugshot)"
    local params = {charId, mugShot}
    local insertId = MySQL.insert.await(query, params)
    if insertId then
        print("[SERVER] Mugshot saved for charid: " .. charId .. " with insertId: " .. insertId)
    else
        print("[SERVER] Failed to save mugshot.")
    end
end)


