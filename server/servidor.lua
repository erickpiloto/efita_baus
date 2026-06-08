local QBCore = exports['qb-core']:GetCoreObject()

local function Notificar(src, msg, tipo)
    TriggerClientEvent('QBCore:Notify', src, msg, tipo or 'error')
end

local function DistanciaValida(src, coords)
    local ped = GetPlayerPed(src)

    if not ped or ped == 0 then
        return false
    end

    local playerCoords = GetEntityCoords(ped)

    local distancia = #(playerCoords - coords)

    return distancia <= 3.0
end

local function AbrirStash(src, stashId, label, peso, slots)

    exports['qb-inventory']:OpenInventory(
        src,
        stashId,
        {
            label = label,
            maxweight = peso,
            slots = slots
        }
    )

end

local function BuscarBauGang(gangName, bauId)

    if not Config.BausFaccoes[gangName] then
        return nil
    end

    for _, bau in pairs(Config.BausFaccoes[gangName]) do

        if bau.id == bauId then
            return bau
        end

    end

    return nil

end

local function BuscarBauJob(jobName, bauId)

    if not Config.BausEmpregos[jobName] then
        return nil
    end

    for _, bau in pairs(Config.BausEmpregos[jobName]) do

        if bau.id == bauId then
            return bau
        end

    end

    return nil

end

local function BuscarBauVIP(bauId)

    for _, bau in pairs(Config.BausVIP) do

        if bau.id == bauId then
            return bau
        end

    end

    return nil

end

local function BuscarBauPublico(bauId)

    for _, bau in pairs(Config.BausPublicos) do

        if bau.id == bauId then
            return bau
        end

    end

    return nil

end

RegisterNetEvent('qb-baus:server:AbrirBauGang', function(data)

    local src = source

    if not data or not data.gang or not data.bau then
        return
    end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    local bau = BuscarBauGang(data.gang, data.bau)

    if not bau then
        return
    end

    if not DistanciaValida(src, bau.coords) then
        return
    end

    local gang = Player.PlayerData.gang.name
    local grade = Player.PlayerData.gang.grade.level

    if gang ~= data.gang then

        Notificar(
            src,
            'Você não pertence a esta facção.'
        )

        return
    end

    if grade < bau.gradeMin then

        Notificar(
            src,
            'Você não possui permissão.'
        )

        return
    end

    if grade > bau.gradeMax then

        Notificar(
            src,
            'Você não possui permissão.'
        )

        return
    end

    AbrirStash(
        src,
        bau.id,
        bau.label,
        bau.peso,
        bau.slots
    )

end)

RegisterNetEvent('qb-baus:server:AbrirBauJob', function(data)

    local src = source

    if not data or not data.job or not data.bau then
        return
    end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    local bau = BuscarBauJob(data.job, data.bau)

    if not bau then
        return
    end

    if not DistanciaValida(src, bau.coords) then
        return
    end

    local job = Player.PlayerData.job.name
    local grade = Player.PlayerData.job.grade.level

    if job ~= data.job then

        Notificar(
            src,
            'Você não pertence a este emprego.'
        )

        return
    end

    if grade < bau.gradeMin then

        Notificar(
            src,
            'Você não possui permissão.'
        )

        return
    end

    if grade > bau.gradeMax then

        Notificar(
            src,
            'Você não possui permissão.'
        )

        return
    end

    AbrirStash(
        src,
        bau.id,
        bau.label,
        bau.peso,
        bau.slots
    )

end)

RegisterNetEvent('qb-baus:server:AbrirBauVIP', function(data)

    local src = source

    if not data or not data.bau then
        return
    end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    local bau = BuscarBauVIP(data.bau)

    if not bau then
        return
    end

    if not DistanciaValida(src, bau.coords) then
        return
    end

    local citizenid = Player.PlayerData.citizenid

    if citizenid ~= bau.citizenid then

        Notificar(
            src,
            'Este baú não pertence a você.'
        )

        return
    end

    AbrirStash(
        src,
        bau.id,
        bau.label,
        bau.peso,
        bau.slots
    )

end)

RegisterNetEvent('qb-baus:server:AbrirBauPublico', function(data)

    local src = source

    if not data or not data.bau then
        return
    end

    local Player = QBCore.Functions.GetPlayer(src)

    if not Player then
        return
    end

    local bau = BuscarBauPublico(data.bau)

    if not bau then
        return
    end

    if not DistanciaValida(src, bau.coords) then
        return
    end

    local citizenid = Player.PlayerData.citizenid

    local stashId = ('publico_%s_%s'):format(
        bau.id,
        citizenid
    )

    AbrirStash(
        src,
        stashId,
        bau.label,
        bau.peso,
        bau.slots
    )

end)

QBCore.Commands.Add(
    Config.ComandoCitizenID,
    'Mostra seu CitizenID',
    {},
    false,
    function(source)

        local Player = QBCore.Functions.GetPlayer(source)

        if not Player then
            return
        end

        Notificar(
            source,
            'Seu CitizenID: ' ..
            Player.PlayerData.citizenid,
            'success'
        )

    end
)
