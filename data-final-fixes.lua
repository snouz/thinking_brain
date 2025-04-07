
local function find_intable(tbl, f, ...)
  if type(f) == "function" then
    for k, v in pairs(tbl) do
      if f(v, k, ...) then
        return v, k
      end
    end
  else
    for k, v in pairs(tbl) do
      if v == f then
        return v, k
      end
    end
  end
  return nil
end

local function make_recipe_category(recipe, cat_name, new_assembling_machine)
  if data.raw.recipe[recipe] and data.raw["assembling-machine"][new_assembling_machine] then
    local assembly = data.raw["assembling-machine"][new_assembling_machine]
    local original_recipe_cat = data.raw.recipe[recipe].category or "crafting"
    local new_cat_name = original_recipe_cat .. "-or-" .. cat_name
    data:extend({{ type = "recipe-category", name = new_cat_name }})
    data.raw.recipe[recipe].category = new_cat_name
    for _, machine in pairs(data.raw["assembling-machine"]) do
      for _, category in pairs(machine.crafting_categories) do
          if category == original_recipe_cat then
            if not find_intable(machine.crafting_categories, new_cat_name) then
              table.insert(machine.crafting_categories, new_cat_name)
            end
            break
          end
      end
    end
    for _, char in pairs(data.raw["character"]) do
      if not char.crafting_categories then
        crafting_categories = {"crafting"}
      end
      for _, category in pairs(char.crafting_categories) do
        if category == original_recipe_cat then
          if not find_intable(char.crafting_categories, new_cat_name) then
            table.insert(char.crafting_categories, new_cat_name)
          end
          break
        end
      end
    end
    if not data.raw["recipe-category"][new_cat_name] then
      data:extend({{ type = "recipe-category", name = new_cat_name }})
    end
    data.raw.recipe[recipe].category = new_cat_name

    if not find_intable(assembly.crafting_categories, new_cat_name) then
      table.insert(assembly.crafting_categories, new_cat_name)
    end
  end
end

local catname = "thinkingbrain"

if mods["Moshine"] then
  make_recipe_category("supercomputer", catname, "thinking-brain")
  make_recipe_category("ai-trainer", catname, "thinking-brain")
  make_recipe_category("data-processor", catname, "thinking-brain")
  make_recipe_category("processing-grid", catname, "thinking-brain")
  make_recipe_category("processing-tile", catname, "thinking-brain")
  make_recipe_category("long-stack-inserter", catname, "thinking-brain")
  make_recipe_category("rail-minimal", catname, "thinking-brain")
end

make_recipe_category("logistic-robot", catname, "thinking-brain")
make_recipe_category("construction-robot", catname, "thinking-brain")
make_recipe_category("flying-robot-frame", catname, "thinking-brain")
make_recipe_category("roboport", catname, "thinking-brain")

make_recipe_category("spidertron", catname, "thinking-brain")
make_recipe_category("lab", catname, "thinking-brain")

make_recipe_category("arithmetic-combinator", catname, "thinking-brain")
make_recipe_category("decider-combinator", catname, "thinking-brain")
make_recipe_category("constant-combinator", catname, "thinking-brain")
make_recipe_category("selector-combinator", catname, "thinking-brain")

make_recipe_category("rail-signal", catname, "thinking-brain")
make_recipe_category("train-stop", catname, "thinking-brain")
make_recipe_category("rail-chain-signal", catname, "thinking-brain")

make_recipe_category("personal-roboport-equipment", catname, "thinking-brain")
make_recipe_category("personal-roboport-mk2-equipment", catname, "thinking-brain")
make_recipe_category("defender-capsule", catname, "thinking-brain")
make_recipe_category("distractor-capsule", catname, "thinking-brain")
make_recipe_category("destroyer-capsule", catname, "thinking-brain")
make_recipe_category("radar", catname, "thinking-brain")



--make_recipe_category("automation-science-pack", catname, "thinking-brain")
--make_recipe_category("logistic-science-pack", catname, "thinking-brain")
make_recipe_category("chemical-science-pack", catname, "thinking-brain")
make_recipe_category("production-science-pack", catname, "thinking-brain")
make_recipe_category("utility-science-pack", catname, "thinking-brain")


make_recipe_category("rocket-turret", catname, "thinking-brain")
make_recipe_category("asteroid-collector", catname, "thinking-brain")