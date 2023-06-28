local QBCore = exports['qb-core']:GetCoreObject()

RegisterNetEvent("papatya")
AddEventHandler("papatya", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    xPlayer.Functions.AddItem("papatya", 1)
    TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Papatya Topladın!', length = 2500,})
end)

RegisterNetEvent("papatyaisleme")
AddEventHandler("papatyaisleme", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if xPlayer.Functions.RemoveItem("papatya", 5) then
        xPlayer.Functions.AddItem("papatyacayi", 1)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Papatya İşledin!', length = 2500,})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Papatya Yok!', length = 2500,})
    end
end)

RegisterNetEvent("papatyasat")
AddEventHandler("papatyasat", function()
    local xPlayer = QBCore.Functions.GetPlayer(source)
    if  xPlayer.Functions.RemoveItem("papatyacayi", 1) then
        xPlayer.Functions.AddMoney( "cash", Config.CayFiyat)
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'success', text = 'Çay Sattın!', length = 2500,})
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = 'Yeterince Çay Yok!', length = 2500,})
    end
end)