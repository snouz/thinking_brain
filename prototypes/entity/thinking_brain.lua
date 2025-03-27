require ("sound-util")
require ("circuit-connector-sprites")
require ("util")
require ("__space-age__.prototypes.entity.circuit-network")
require ("__space-age__.prototypes.entity.space-platform-hub-cockpit")

local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
local space_age_sounds = require ("__space-age__.prototypes.entity.sounds")
local meld = require("meld")
local simulations = require("__space-age__.prototypes.factoriopedia-simulations")
local procession_graphic_catalogue_types = require("__base__/prototypes/planet/procession-graphic-catalogue-types")

local biochamber_pictures = require("__space-age__.prototypes.entity.biochamber-pictures")


--[[
local thinkingbrain_on_animation_layers =
{
  {
    filename = "__factorioplus__/graphics/lab-large-on.png",
    width = 1440/6,
    height = 664/3,
    frame_count = 18,
    line_length = 6,
    animation_speed = 1/3,
    scale = 0.65,
    shift = util.by_pixel(0, 1.5),
  },
  {
    filename = "__factorioplus__/graphics/lab-large-shadow.png",
    width = 388,
    height = 295,
    frame_count = 1,
    repeat_count = 18,
    shift = util.by_pixel(16, 1.5),
    scale = 0.5,
    draw_as_shadow = true,
  },
  {
    filename = "__factorioplus__/graphics/lab-large-mask.png",
    blend_mode = "additive",
    width = 1440/6,
    height = 664/3,
    frame_count = 18,
    line_length = 6,
    animation_speed = 1/3,
    scale = 0.65,
    shift = util.by_pixel(0, 1.5),
    draw_as_light = true,
  },
}

local thinkingbrain_off_animation_layers =
{
  {
    filename = "__factorioplus__/graphics/lab-large-on.png",
    width = 1440/6,
    height = 664/3,
    frame_count = 1,
    line_length = 1,
    -- animation_speed = 1 / 3,
    scale = 0.65,
    shift = util.by_pixel(0, 1.5),
  },
  {
    filename = "__factorioplus__/graphics/lab-large-shadow.png",
    width = 388,
    height = 295,
    frame_count = 1,
    shift = util.by_pixel(16, 1.5),
    scale = 0.5,
    draw_as_shadow = true,
  }
}]]


local vert_shift = -4
local anim_speed = 0.1

data:extend({
  {
    type = "assembling-machine",
    name = "thinking-brain",
    icon = "__space-age__/graphics/icons/biochamber.png",
    flags = {"placeable-neutral","placeable-player", "player-creation"},
    minable = {mining_time = 0.2, result = "thinking-brain"},
    crafting_categories = {"thinkingbrain"},
    fast_replaceable_group = "thinking-brain",
    max_health = 600,
    corpse = "thinking-brain-remnants",
    dying_explosion = "biochamber-explosion",
    icon_draw_specification = {shift = {0, 0.1}},
    circuit_wire_max_distance = assembling_machine_circuit_wire_max_distance,
    circuit_connector = circuit_connector_definitions.create_vector
    (
      universal_connector_template,
      {
        { variation = 17, main_offset = util.by_pixel( -40, 21), shadow_offset = util.by_pixel( -32, 25), show_shadow = false },
        { variation = 17, main_offset = util.by_pixel( -40, 21), shadow_offset = util.by_pixel( -32, 25), show_shadow = false },
        { variation = 17, main_offset = util.by_pixel( -40, 21), shadow_offset = util.by_pixel( -32, 25), show_shadow = false },
        { variation = 17, main_offset = util.by_pixel( -40, 21), shadow_offset = util.by_pixel( -32, 25), show_shadow = false },
      }
    ),
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    drawing_box_vertical_extension = 0.4,
    module_slots = 4,
    allowed_effects = {"consumption", "speed", "productivity", "pollution", "quality"},
    effect_receiver = { base_effect = { productivity = 0.7 }},

    --graphics_set = require("__space-age__.prototypes.entity.biochamber-pictures").graphics_set,











    graphics_set =
    {
      animation_progress = 0.15,
      --always_draw_idle_animation = false,
      states =
      {
        {
          name = "idle",
          duration = 1,
          next_active = "working",
          next_inactive = "idle",
        },
        {
          name = "working",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim",
        },
        {
          name = "idle_anim",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim2",
        },
        {
          name = "idle_anim2",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim3",
        },
        {
          name = "idle_anim3",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim4",
        },
        {
          name = "idle_anim4",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim5",
        },
        {
          name = "idle_anim5",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim6",
        },
        {
          name = "idle_anim6",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim7",
        },
        {
          name = "idle_anim7",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim8",
        },
        {
          name = "idle_anim8",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim9",
        },
        {
          name = "idle_anim9",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim10",
        },
        {
          name = "idle_anim10",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim11",
        },
        {
          name = "idle_anim11",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim12",
        },
        {
          name = "idle_anim12",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim13",
        },
        {
          name = "idle_anim13",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim14",
        },
        {
          name = "idle_anim14",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim15",
        },
        {
          name = "idle_anim15",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim16",
        },
        {
          name = "idle_anim16",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim17",
        },
        {
          name = "idle_anim17",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim18",
        },
        {
          name = "idle_anim18",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim19",
        },
        {
          name = "idle_anim19",
          duration = 64,
          next_active = "working",
          next_inactive = "idle_anim20",
        },
        {
          name = "idle_anim20",
          duration = 64,
          next_active = "working",
          next_inactive = "idle",
        },
      },
      --[[idle_animation =
      {
        layers =
        {
          {
            filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-idle.png",
            priority = "high",
            width = 270,
            height = 310,
            --repeat_count = 64,
            frame_count = 64,
            line_length = 8,
            animation_speed = anim_speed,
            run_mode = "forward",
            shift = util.by_pixel(0, vert_shift),
            scale = 0.5
          },
          {
            filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-shadow.png",
            priority = "high",
            width = 500,
            height = 350,
            repeat_count = 64,
            line_length = 1,
            --animation_speed = anim_speed,
            --run_mode = "forward",
            shift = util.by_pixel(0, vert_shift),
            scale = 0.5,
            draw_as_shadow = true,
          },
        }
      },]]
      working_visualisations =
      {
        {
          name = "anim",
          always_draw = true,
          constant_speed = true,
          draw_in_states = {"working"},
          animation = 
          { 
            layers = {
              {
                filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-anim.png",
                priority="high",
                width = 270,
                height = 310,
                frame_count = 64,
                line_length = 8,
                animation_speed = anim_speed,
                run_mode = "forward",
                shift = util.by_pixel(0, vert_shift),
                scale = 0.5,
              },
            }
          },
        },

        {
          name = "light",
          fadeout = true,
          always_draw = true,
          constant_speed = true,
          draw_in_states = {"working"},
          animation = 
          { 
            layers = {
              {
                filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-anim-light.png",
                priority="high",
                width = 270,
                height = 310,
                frame_count = 64,
                line_length = 8,
                animation_speed = anim_speed,
                run_mode = "forward",
                shift = util.by_pixel(0, vert_shift),
                scale = 0.5,
                draw_as_glow = true,
                blend_mode = "additive",
              },
            }
          },
        },


        {
          name = "shadow",
          always_draw = true,
          constant_speed = true,
          draw_in_states = {"idle", "working", "idle_anim", "idle_anim2", "idle_anim3", "idle_anim4", "idle_anim5", "idle_anim6", "idle_anim7", "idle_anim8", "idle_anim9", "idle_anim10", "idle_anim11", "idle_anim12", "idle_anim13", "idle_anim14", "idle_anim15", "idle_anim16", "idle_anim17", "idle_anim18", "idle_anim19", "idle_anim20"},
          animation = 
          { 
            layers = {
              {
                filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-shadow.png",
                priority = "high",
                width = 500,
                height = 350,
                repeat_count = 64,
                line_length = 1,
                --animation_speed = anim_speed,
                --run_mode = "forward",
                shift = util.by_pixel(0, vert_shift),
                scale = 0.5,
                draw_as_shadow = true,
              },
            }
          },
        },

        {
          name = "idle",
          always_draw = true,
          --fadeout = true,
          draw_in_states = {"idle", "idle_anim", "idle_anim2", "idle_anim3", "idle_anim4", "idle_anim5", "idle_anim6", "idle_anim7", "idle_anim8", "idle_anim9", "idle_anim10", "idle_anim11", "idle_anim12", "idle_anim13", "idle_anim14", "idle_anim15", "idle_anim16", "idle_anim17", "idle_anim18", "idle_anim19", "idle_anim20"},
          animation =
          {
            layers =
            {
              {
                filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-idle.png",
                priority = "high",
                width = 270,
                height = 310,
                --repeat_count = 64,
                frame_count = 64,
                line_length = 8,
                animation_speed = anim_speed,
                --run_mode = "forward",
                shift = util.by_pixel(0, vert_shift),
                scale = 0.5
              },
            }
          },
        },
      },


      frozen_patch =
      {
        filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-frozen.png",
        width = 270,
        height = 310,
        shift = util.by_pixel(0, vert_shift),
        line_length = 1,
        scale = 0.5,
      },
      reset_animation_when_frozen = true,
    },






    impact_category = "metal-large",
    open_sound = {filename = "__base__/sound/open-close/fluid-open.ogg", volume = 0.55},
    close_sound = {filename = "__base__/sound/open-close/fluid-close.ogg", volume = 0.54},
    working_sound =
    {
      sound = {filename = "__space-age__/sound/entity/biochamber/biochamber-loop.ogg", volume = 0.4},
      max_sounds_per_prototype = 3,
      fade_in_ticks = 4,
      fade_out_ticks = 20
    },
    crafting_speed = 2,
    energy_source =
    {
      type = "burner",
      fuel_categories = {"nutrients"},
      effectivity = 1,
      burner_usage = "nutrients",
      fuel_inventory_size = 1,
      emissions_per_minute = { pollution = 1 },
      light_flicker = require("__space-age__.prototypes.entity.biochamber-pictures").light_flicker
    },
    energy_usage = "500kW",
    heating_energy = "100kW",
    
    fluid_boxes_off_when_no_fluid_recipe = true,
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {-1, -1}
          }
        }
      },
      {
        production_type = "input",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction="input",
            direction = defines.direction.north,
            position = {1, -1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_1,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_1_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_2,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_2_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {1, 1}
          }
        }
      },
      {
        production_type = "output",
        pipe_picture =                 biochamber_pictures.pipe_pictures_2,
        pipe_picture_frozen =          biochamber_pictures.pipe_pictures_2_frozen,
        mirrored_pipe_picture =        biochamber_pictures.pipe_pictures_1,
        mirrored_pipe_picture_frozen = biochamber_pictures.pipe_pictures_1_frozen,
        pipe_covers = pipecoverspictures(),
        volume = 1000,
        pipe_connections =
        {
          {
            flow_direction = "output",
            direction = defines.direction.south,
            position = {-1, 1}
          }
        }
      }
    },
    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/chemical-plant/chemical-plant-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 36,
        shift = util.by_pixel(5, 60),
        variation_count = 4,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = true
    },
    production_health_effect = nil
  },


  {
    type = "corpse",
    name = "thinking-brain-remnants",
    icon = "__base__/graphics/icons/wooden-chest.png",
    hidden_in_factoriopedia = true,
    flags = {"placeable-neutral", "building-direction-8-way", "not-on-map"},
    subgroup = "production-machine-remnants",
    order = "a-a-a",
    selection_box = {{-2, -2}, {2, 2}},
    tile_width = 4,
    tile_height = 4,
    selectable_in_game = false,
    time_before_removed = 60 * 60 * 15, -- 15 minutes
    expires = false,
    final_render_layer = "remnants",
    --remove_on_tile_placement = false,
    animation =
    {
      filename = "__thinking_brain__/graphics/entity/thinking_brain/thinking_brain-remnants.png",
      line_length = 1,
      width = 500,
      height = 350,
      direction_count = 1,
      shift = util.by_pixel(0, vert_shift),
      scale = 0.5
    }
  },
})
