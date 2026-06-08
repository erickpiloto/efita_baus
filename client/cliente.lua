local QBCore = exports['qb-core']:GetCoreObject()

local function CriarTarget(nome, label, coords, evento, dados)
    exports['qb-target']:AddBoxZone(
        nome,
        coords,
        1.5,
        1.5,
        {
            name = nome,
            heading = 0.0,
            debugPoly = false,
            minZ = coords.z - 1.0,
            maxZ = coords.z + 1.0
        },
        {
            options = {
                {
                    icon = 'fas fa-box-open',
                    label = label,

                    action = function()
                        TriggerServerEvent(evento, dados)
                    end
                }
            },

            distance = Config.TargetDistance or 2.0
        }
    )
end

CreateThread(function()

    Wait(2000)

    -- FACÇÕES

    for gangName, listaBaus in pairs(Config.BausFaccoes) do

        for _, bau in pairs(listaBaus) do

            CriarTarget(
                'bau_gang_' .. bau.id,
                bau.label,
                bau.coords,
                'qb-baus:server:AbrirBauGang',
                {
                    gang = gangName,
                    bau = bau.id
                }
            )

        end

    end

    -- EMPREGOS

    for jobName, listaBaus in pairs(Config.BausEmpregos) do

        for _, bau in pairs(listaBaus) do

            CriarTarget(
                'bau_job_' .. bau.id,
                bau.label,
                bau.coords,
                'qb-baus:server:AbrirBauJob',
                {
                    job = jobName,
                    bau = bau.id
                }
            )

        end

    end

    -- VIP

    for _, bau in pairs(Config.BausVIP) do

        CriarTarget(
            'bau_vip_' .. bau.id,
            bau.label,
            bau.coords,
            'qb-baus:server:AbrirBauVIP',
            {
                bau = bau.id
            }
        )

    end

    -- PÚBLICOS

    for _, bau in pairs(Config.BausPublicos) do

        CriarTarget(
            'bau_publico_' .. bau.id,
            bau.label,
            bau.coords,
            'qb-baus:server:AbrirBauPublico',
            {
                bau = bau.id
            }
        )

    end

    print('^2[qb-baus]^7 Targets carregados.')

end)

AddEventHandler('onResourceStop', function(resourceName)

    if resourceName ~= GetCurrentResourceName() then
        return
    end

    -- FACÇÕES

    for _, listaBaus in pairs(Config.BausFaccoes) do

        for _, bau in pairs(listaBaus) do

            exports['qb-target']:RemoveZone(
                'bau_gang_' .. bau.id
            )

        end

    end

    -- EMPREGOS

    for _, listaBaus in pairs(Config.BausEmpregos) do

        for _, bau in pairs(listaBaus) do

            exports['qb-target']:RemoveZone(
                'bau_job_' .. bau.id
            )

        end

    end

    -- VIP

    for _, bau in pairs(Config.BausVIP) do

        exports['qb-target']:RemoveZone(
            'bau_vip_' .. bau.id
        )

    end

    -- PÚBLICOS

    for _, bau in pairs(Config.BausPublicos) do

        exports['qb-target']:RemoveZone(
            'bau_publico_' .. bau.id
        )

    end

end)
