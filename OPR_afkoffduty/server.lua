ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent("OPR:auto:offduty")
AddEventHandler("OPR:auto:offduty", function()
    local xPlayer = ESX.GetPlayerFromId(source) 
    if xPlayer ~= nil and xPlayer.job ~= nil and xPlayer.job.name == Config.PoliceOnDuty then
        local newGrade = xPlayer.job.grade
        xPlayer.setJob(Config.PoliceOffDuty, newGrade)
    else
        print("Player not found or not in the required job.")
    end
end)
