data:extend({
  {
    type = "technology",
    name = "thinking-brain-technology",
    icon = "__thinking_brain__/graphics/technology/thinking_brain_tech.png",
    icon_size = 256,
    effects = {
      {
        type = "unlock-recipe",
        recipe = "thinking-brain",
      },
    },
    prerequisites = { "productivity-module-2", "uranium-processing" },
    unit = {
      count = 450,
      ingredients = {
        { "automation-science-pack", 1 },
        { "logistic-science-pack", 1 },
        { "chemical-science-pack", 1 },
        { "space-science-pack", 1 },
      },
      time = 60,
    },
  },
})