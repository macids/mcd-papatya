QBCore = nil 

Citizen.CreateThread(function()
   while QBCore == nil do
   	TriggerEvent('QBCore:GetObject', function(obj) QBCore = obj end)
   	Citizen.Wait(250)
   end
end)

-- Toplama
local papatyatoplama = Config.PapatyaToplama

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, papatyatoplama.x, papatyatoplama.y, papatyatoplama.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, papatyatoplama.x, papatyatoplama.y, papatyatoplama.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(papatyatoplama.x, papatyatoplama.y, papatyatoplama.z, '[E] Papatya Topla')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "papatya",
                            duration = 5000,
                            label = "Papatya Topluyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("papatya")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

-- İşleme
local papatyaisleme = Config.PapatyaIsleme

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, papatyaisleme.x, papatyaisleme.y, papatyaisleme.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, papatyaisleme.x, papatyaisleme.y, papatyaisleme.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(papatyaisleme.x, papatyaisleme.y, papatyaisleme.z, '[E] Papatya İşle')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "üzüm",
                            duration = 5000,
                            label = "Papatya İşliyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("papatyaisleme")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

--Satış
local papatyasatis = Config.PapatyaSatis

Citizen.CreateThread(function()
    while true do
        local sleep = 2000
        local player = PlayerPedId()
        local playercoords = GetEntityCoords(player)
        local distance = GetDistanceBetweenCoords(playercoords, papatyasatis.x, papatyasatis.y, papatyasatis.z, true)
        if distance < 30 then
            sleep = 1
            DrawMarker(2, papatyasatis.x, papatyasatis.y, papatyasatis.z - 1.5 + 1, 0.0, 0.0, 0.0, 0.0, 0, 0.0, Config.MarkerBoyutu, Config.MarkerBoyutu, Config.MarkerBoyutu, 255, 255, 0, 50, false, true, 2, nil, nil, false)
            if distance < 5 then
                sleep = 1
                    DrawText3D(papatyasatis.x, papatyasatis.y, papatyasatis.z, '[E] Çay Sat')
                    if IsControlJustReleased(0, 38) then
                        TriggerEvent("mythic_progbar:client:progress", {
                            name = "papatya",
                            duration = 5000,
                            label = "Papatya çayı Satıyorsun",
                            useWhileDead = false,
                            canCancel = true,
                            controlDisables = {
                                disableMovement = true,
                                disableCarMovement = true,
                                disableMouse = false,
                                disableCombat = true,
                            },
                            animation = {
                                animDict = "amb@prop_human_bum_shopping_cart@male@idle_a",
                                anim = "idle_c",
                                flags = 49,
                            },
                        }, function(status)
                            if not status then
                                TriggerServerEvent("papatyasat")
                            end
                        end)
                    end
            end
        end
        Citizen.Wait(sleep)
    end
end)

function DrawText3D(x,y,z, text)
    local onScreen,_x,_y=World3dToScreen2d(x,y,z)
    local px,py,pz=table.unpack(GetGameplayCamCoords())
    SetTextScale(0.30, 0.30)
    SetTextFont(0)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(1)
    AddTextComponentString(text)
    DrawText(_x,_y)
    local factor = (string.len(text)) / 250
    DrawRect(_x,_y+0.0125, 0.015+ factor, 0.03, 0, 0, 0, 75)
end

if Config.BlipAc then
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PapatyaToplamaBlip.x, Config.PapatyaToplamaBlip.y, Config.PapatyaToplamaBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PapatyaToplamaBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PapatyaIslemeBlip.x, Config.PapatyaIslemeBlip.y, Config.PapatyaIslemeBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PapatyaIslemeBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
    CreateThread(function()
        local blip = AddBlipForCoord(Config.PapatyaSatisBlip.x, Config.PapatyaSatisBlip.y, Config.PapatyaSatisBlip.z)
        SetBlipSprite(blip, 93)
        SetBlipAsShortRange(blip, true)
        SetBlipScale(blip, 0.5)
        SetBlipColour(blip, 51)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.PapatyaSatisBlipAd)
        EndTextCommandSetBlipName(blip)
    end)
end
  