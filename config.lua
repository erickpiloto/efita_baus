Config = {}

Config.ComandoCitizenID = 'meucid'

Config.TargetDistance = 2.0

Config.BausFaccoes = {

    ['ballas'] = {

        {
            id = 'ballas_recruta',
            label = 'Baú Recruta',

            gradeMin = 0,
            gradeMax = 4,

            slots = 50,
            peso = 50000,

            coords = vector3(120.0, 120.0, 120.0)
        },

        {
            id = 'ballas_armas',
            label = 'Baú de Armas',

            gradeMin = 2,
            gradeMax = 4,

            slots = 250,
            peso = 300000,

            coords = vector3(122.0, 120.0, 120.0)
        },

        {
            id = 'ballas_lideranca',
            label = 'Baú Liderança',

            gradeMin = 4,
            gradeMax = 4,

            slots = 500,
            peso = 1000000,

            coords = vector3(124.0, 120.0, 120.0)
        }

    }

}

Config.BausEmpregos = {

    ['police'] = {

        {
            id = 'police_recruta',
            label = 'Armário Recruta',

            gradeMin = 0,
            gradeMax = 4,

            slots = 50,
            peso = 50000,

            coords = vector3(450.0, -980.0, 30.0)
        },

        {
            id = 'police_supervisao',
            label = 'Armário Supervisão',

            gradeMin = 2,
            gradeMax = 4,

            slots = 200,
            peso = 200000,

            coords = vector3(452.0, -980.0, 30.0)
        },

        {
            id = 'police_comando',
            label = 'Armário Comando',

            gradeMin = 4,
            gradeMax = 4,

            slots = 500,
            peso = 1000000,

            coords = vector3(454.0, -980.0, 30.0)
        }

    }

}

Config.BausVIP = {

    {
        citizenid = 'ABC12345',

        id = 'vip_abc12345',
        label = 'Baú VIP Erick',

        slots = 500,
        peso = 1000000,

        coords = vector3(-100.0, -1000.0, 30.0)
    }

}

Config.BausPublicos = {

    {
        id = 'praca_central',

        label = 'Baú Público',

        slots = 100,
        peso = 100000,

        coords = vector3(-40.0, -1100.0, 26.0)
    }

}