



data:extend({
  {
    type = "recipe-category",
    name = "thinkingbrain"
  },
  {
    type = "recipe",
    name = "thinking-brain",
    energy_required = 10,
    category = "crafting-with-fluid",
    ingredients =
    {
      {type = "item", name = "processing-unit", amount = 10},
      {type = "item", name = "productivity-module-2", amount = 10},
      {type = "item", name = "low-density-structure", amount = 5},
      {type = "item", name = "uranium-235", amount = 5},
      {type = "item", name = "raw-fish", amount = 10},
      {type = "fluid", name = "water", amount = 150},
    },
    results = {{type = "item", name = "thinking-brain", amount = 1}},
    allow_productivity = false,
    enabled = false,
  },
})


