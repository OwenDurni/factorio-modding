local tables = {}

--- Merges the `t` table into the `s` table, overwriting values with same keys.
function tables.updateAll(s, t)
  for i, v in pairs(t) do
    s[i] = v
  end
  return s
end

--- Merges the `t` table into a copy of the `s` table, overwriting values with same keys.
function tables.copyUpdateAll(s, t)
  return tables.updateAll(table.deepcopy(s), t)
end

return tables
