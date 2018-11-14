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
    text = request.body.read
    time = Time.now
    File.open("data/#{time}.txt","w+") do |file|
        file.puts text
    end
end

get '/' do
    @title = "remote signer"
    text = "### how to use\n ``` curl http://localhost:2323/signer -X POST -d 'sometext' ```"
    @md = markdown(text)
    erb :index
end

get '/keys/:key_hash' do
    key_hash = "tz1T2YBEeVymtA4rPrdMLyF9E8oTRXUjKVsG"
    json = {
        :public_key => "edpkuw8rM4y4i4Diti38DLiigFxSCwkHrjpdxzHX3u54VqVtsLPdhW"
    }.to_json
    "#{json}"
end

post '/signer' do
    text = request.body.read
    time = Time.now
    File.open("data/#{time}.txt","w+") do |file|
        file.puts text
    end
    "#{text}"
end
