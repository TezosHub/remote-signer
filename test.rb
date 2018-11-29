require "json"
require "pp"
# json = File.read('keys.json')
# keys = JSON.parse(json)
# for key in keys do
#     puts key["pkh"]
# end
def hsmconf()
    {
        :user => "user",
        :passwd => "123456",
        :handle => "19"
    }
end

def en()
    user = hsmconf[:passwd]
end

puts en()