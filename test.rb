require "json"
require "pp"
json = File.read('keys.json')
keys = JSON.parse(json)
for key in keys do
    puts key["pkh"]
end