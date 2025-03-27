
function find_intable(tbl, f, ...)
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

function make_recipe_category(recipe, cat_name, new_assembling_machine)
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
    if not data.raw["recipe-category"][new_cat_name] then
      data:extend({{ type = "recipe-category", name = new_cat_name }})
    end
    data.raw.recipe[recipe].category = new_cat_name

    if not find_intable(assembly.crafting_categories, new_cat_name) then
      table.insert(assembly.crafting_categories, new_cat_name)
    end
  end
end


if mods["Moshine"] then
  make_recipe_category("supercomputer", "thinkingbrain", "thinking-brain")
  make_recipe_category("ai-trainer", "thinkingbrain", "thinking-brain")
  make_recipe_category("data-processor", "thinkingbrain", "thinking-brain")
  make_recipe_category("processing-grid", "thinkingbrain", "thinking-brain")
  make_recipe_category("processing-tile", "thinkingbrain", "thinking-brain")
  make_recipe_category("long-stack-inserter", "thinkingbrain", "thinking-brain")
  make_recipe_category("rail-minimal", "thinkingbrain", "thinking-brain")

end

make_recipe_category("logistic-robot", "thinkingbrain", "thinking-brain")
make_recipe_category("construction-robot", "thinkingbrain", "thinking-brain")
make_recipe_category("roboport", "thinkingbrain", "thinking-brain")

make_recipe_category("spidertron", "thinkingbrain", "thinking-brain")

make_recipe_category("arithmetic-combinator", "thinkingbrain", "thinking-brain")
make_recipe_category("decider-combinator", "thinkingbrain", "thinking-brain")
make_recipe_category("constant-combinator", "thinkingbrain", "thinking-brain")
make_recipe_category("selector-combinator", "thinkingbrain", "thinking-brain")

make_recipe_category("rail-signal", "thinkingbrain", "thinking-brain")
make_recipe_category("train-stop", "thinkingbrain", "thinking-brain")
make_recipe_category("rail-chain-signal", "thinkingbrain", "thinking-brain")

--make_recipe_category("personal-roboport-equipment", "thinkingbrain", "thinking-brain")
--make_recipe_category("personal-roboport-mk2-equipment", "thinkingbrain", "thinking-brain")
make_recipe_category("defender-capsule", "thinkingbrain", "thinking-brain")
make_recipe_category("distractor-capsule", "thinkingbrain", "thinking-brain")
make_recipe_category("destroyer-capsule", "thinkingbrain", "thinking-brain")
make_recipe_category("radar", "thinkingbrain", "thinking-brain")

make_recipe_category("asteroid-collector", "thinkingbrain", "thinking-brain")


make_recipe_category("automation-science-pack", "thinkingbrain", "thinking-brain")
--make_recipe_category("logistic-science-pack", "thinkingbrain", "thinking-brain")
--make_recipe_category("chemical-science-pack", "thinkingbrain", "thinking-brain")
--make_recipe_category("production-science-pack", "thinkingbrain", "thinking-brain")
make_recipe_category("utility-science-pack", "thinkingbrain", "thinking-brain")

