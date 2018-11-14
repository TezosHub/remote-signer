keys = [
    {
        :public_key_hash => "tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo",
        :public_key => "edpkuuV16fGKAAZifZZqz52oX8LHfUh3smLywuzyrJkKGx1nXrTWcS",
        :private_key => "edsk3xkRt2oBvh5HJejNsGwKgSdc2QrCXGU4Deyj8MY9G9edQhdTsn"
    }
]
for key in keys do
    puts key[:public_key_hash]
end