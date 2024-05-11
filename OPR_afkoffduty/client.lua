Citizen.CreateThread(function()
    while true do
        Wait(1000)

        local playerPed = PlayerPedId()
        if playerPed then
            local currentPos = GetEntityCoords(playerPed, true)

            if prevPos and currentPos == prevPos then
                if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == Config.PoliceOnDuty then
                    if timeLeft > 0 then
                        if Config.Warning and timeLeft == math.ceil(Config.seconds / 4) then
                            if Config.EnableWarningSound then
                                PlaySoundFrontend(-1, "BASE_JUMP_PASSED", "HUD_AWARDS", 0, 1)
                            end
                            if Config.Framework == "esx" then
                                ESX.ShowNotification(Config.offdutySoonMsg .. " " .. timeLeft .. " seconds" .. " (" .. Config.Notifytreason .. ")", Config.Notifytime)
                            elseif Config.Framework == "qbcore" then
                                TriggerEvent("qb:sendNotification", {text = Config.offdutySoonMsg .. " " .. timeLeft .. " seconds" .. " (" .. Config.Notifytreason .. ")", type = "warning", timeout = Config.Notifytime, layout = "centerLeft", queue = "left"})
                            end
                        end

                        timeLeft = timeLeft - 1
                    else
                        TriggerServerEvent("OPR:auto:offduty")
                    end
                else
                    timeLeft = Config.seconds
                end
            end

            prevPos = currentPos
        end
    end
end)
