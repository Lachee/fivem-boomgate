
-- If we get a boom gate request, we send back to all clients to open it
RegisterServerEvent('lacheeboom:requestBoomGate')
AddEventHandler('lacheeboom:requestBoomGate', function(coords)
    TriggerClientEvent('lacheeboom:openBoomGate', -1, coords)
end)