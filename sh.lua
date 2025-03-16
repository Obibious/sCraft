personalCraftTitle = 'Craft personnel'

PersonalCraftItems = {
    {
        label = 'Burger',
        name = 'burger',
        type = 'item',
        quantity = 10,
        description = 'Un burger avec du pain, de la viande, de la salade, de la tomate et de l\'oignon.',
        timeToCraft = 5,
        category = 'food',
        animDict = 'amb@prop_human_bum_bin@base',
        anim = "base",
        itemsNeeded = {
            {
                name = 'bread',
                label = 'Pain',
                quantity = 1
            }
        }
    },
    {
        label = 'Pistolet',
        name = 'pistol',
        type = 'weapon',
        ammo = 10,
        quantity = 10,
        description = 'Un pistolet berreta.',
        timeToCraft = 10,
        category = 'weapons',
        animDict = 'amb@prop_human_bum_bin@base',
        anim = "base",
        itemsNeeded = {
            {
                name = 'nail',
                label = 'Nail',
                quantity = 15
            },
            {
                name = 'mpipe',
                label = 'Metal',
                quantity = 15
            }
        }
    }
}


PersonalCategories = {
    {
        label = 'Tout',
        name = 'all',
    },
    {
        label = 'Nourriture',
        name = 'food',
    },
    {
        label = 'Armes',
        name = 'weapons',
    },
    {
        label = 'Armures',
        name = 'armors',
    }
}

-- partie pour les jobs 
-- ['ALL'] pour que n'importe qui puisse accéder au craft exemple : pour faire un craft illégal ou autre


JobsCraftItems = {
    ['unemployed'] = {
            title = 'Cuisine burgershot',
            pos = vector3(39.257145, -1303.068115, 29.195),
            categories = {
                {
                    label = 'Tout',
                    name = 'all',
                },
                {
                    label = 'Burger',
                    name = 'burger',
                }
            },
            items = {
                {
                    label = 'Burger',
                    name = 'burger',
                    type = 'item',
                    quantity = 10,
                    description = 'Un burger avec du pain, de la viande, de la salade, de la tomate et de l\'oignon.',
                    timeToCraft = 5,
                    category = 'burger',
                    animDict = 'amb@prop_human_bum_bin@base',
                    anim = "base",
                    itemsNeeded = {
                        {
                            name = 'bread',
                            label = 'Pain',
                            quantity = 1
                        }
                    }
                }
            }
    },
    ['ALL'] = {
            title = 'Craft illégal',
            pos = vector3(39.257145, -1303.068115, 29.195),
            categories = {
                {
                    label = 'Tout',
                    name = 'all',
                },
                {
                    label = 'Pistolet',
                    name = 'gun',
                }
            },
            items = {
                {
                    label = 'Weapon',
                    name = 'weapon',
                    type = 'weapon',
                    quantity = 10,
                    description = 'Un pistolet berreta.',
                    timeToCraft = 5,
                    category = 'gun',
                    animDict = 'amb@prop_human_bum_bin@base',
                    anim = "base",
                    itemsNeeded = {
                        {
                            name = 'bread',
                            label = 'Pain',
                            quantity = 1
                    }
                }
            }
        }
    }
}
