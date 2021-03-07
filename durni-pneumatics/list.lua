local list = {}

--- Nested search in a list of records.
--  In the list `t` Return the table that contains an index `key` with the specified `value`. If no
--  such table exists, returns `default`.
function list.kvFind(t, key, value, default)
  for _,x in ipairs(t) do
    if x[key] == value then
        return x
    end
  end
  return default
end

return list