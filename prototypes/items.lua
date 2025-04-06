local item_sounds = require("__base__.prototypes.item_sounds")
local item_tints = require("__base__.prototypes.item-tints")
local space_age_item_sounds = require("__space-age__.prototypes.item_sounds")

data:extend({
  {
    type = "item",
    name = "thinking-brain",
    icon = "__thinking_brain__/graphics/icons/thinking_brain_icon.png",
    subgroup = "production-machine",
    order = "hb[cloning-vat]",
    inventory_move_sound = item_sounds.mechanical_inventory_move,
    pick_sound = item_sounds.mechanical_inventory_pickup,
    drop_sound = item_sounds.mechanical_inventory_move,
    place_result = "thinking-brain",
    stack_size = 10,
    default_import_location = "nauvis",
    weight = 100 * kg
  },
})
