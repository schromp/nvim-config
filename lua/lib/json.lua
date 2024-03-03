local cjson = require("cjson")

local function read_file(path)
    local file = io.open(path, 'r')  -- Open the file in read mode
    if file then
        local content = file:read('*a')  -- jead the entire file into a string
        file:close()  -- Close the file
        return content  -- Return the content as a string
    else
        return nil  -- Return nil if the file couldn't be opened
    end
end

local file_content = read_file('/home/lk/.config/nvim/config.json')

local jsonVariables = {}

if file_content ~= nil then
    jsonVariables = cjson.decode(file_content)
end

DynConfig = {
    theme = jsonVariables.theme or "default",
    transparent = jsonVariables.transparent or false,
}

return DynConfig
