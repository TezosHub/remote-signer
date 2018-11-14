require "json"
require "pp"
require 'sinatra'
require "rdiscount"


port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port

set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "static") }
set :views, Proc.new { File.join(root, "view") }

before do
    if request.request_method == "POST"
        text = request.body.read
        time = Time.now
        File.open("data/#{time}.txt","w+") do |file|
            file.puts text
        end
    end
end

get '/' do
    @title = "remote signer"
    text = "### how to use\n ``` curl http://localhost:2323/signer -X POST -d 'sometext' ```"
    @md = markdown(text)
    erb :index
end

get '/keys/:key_hash' do
    key_hash = params["key_hash"]
    keys = [
        {
            :public_key_hash => "tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo",
            :public_key => "edpkuuV16fGKAAZifZZqz52oX8LHfUh3smLywuzyrJkKGx1nXrTWcS",
            :private_key => "edsk3xkRt2oBvh5HJejNsGwKgSdc2QrCXGU4Deyj8MY9G9edQhdTsn"
        }
    ]
    for key in keys do
        if key[:public_key_hash] == key_hash
            public_key = key[:public_key]
            @json = {
                :public_key => public_key
            }.to_json
            halt @json
        end
    end

    "Key not found"
end

post '/signer' do
    content_type :json
    text = request.body.read
    time = Time.now
    File.open("data/#{time}.txt","w+") do |file|
        file.puts text
    end
    "#{text}"
end
