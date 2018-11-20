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


def sig(private_key,un_sig_text)
    @out = ""
    cmd = "node ~/signer-off/sig.js #{un_sig_text}"
    puts cmd
    IO.popen(cmd) do |f|
        begin
        line = f.gets
        @out = "#{@out}#{line}".chomp
        end while line!=nil
    end
    @out
end

# before do
#     if request.request_method == "POST"
#         text = request.body.read
#         time = Time.now.to_i
#         File.open("data/#{time}.txt","w+") do |file|
#             file.puts text
#         end
#     end
# end

get '/' do
    @title = "remote signer"
    text = "### how to use\n ``` curl http://localhost:2323/signer -X POST -d 'sometext' ```"
    @md = markdown(text)
    erb :index
end

get '/keys/:key_hash' do
    headers \
        "Content-type" => "application/json"
    key_hash = params["key_hash"]
    keys = [
        {
            :public_key_hash => "tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo",
            :public_key => "edpkuuV16fGKAAZifZZqz52oX8LHfUh3smLywuzyrJkKGx1nXrTWcS",
            :private_key => "edsk3xkRt2oBvh5HJejNsGwKgSdc2QrCXGU4Deyj8MY9G9edQhdTsn"
        },
        # alice
        {
            :public_key_hash => "tz1amfhHn47i5ZYVnUGsTodsZW6G52vqAThE",
            :public_key => "edpkvJgayg1PDSC8PQhYHR2vC2QXfKkRrQe8BboAN9nU8ssNdARzWe",
            :private_key => "edsk2rTLCMy9DPkxsdECiZ1kp24n6ngSWQbFsa36D3RjK5F2GdsbgA"
        }
    ]
    for key in keys do
        if key[:public_key_hash] == key_hash
            public_key = key[:public_key]
            @json = {
                :public_key => public_key
            }
            halt JSON @json
        end
    end

    "Key not found"
end

post '/keys/:key_hash' do
    headers \
        "Content-type" => "application/json"
    un_sig_text = request.body.read
    time = Time.now.to_i
    File.open("data/#{time}.txt","w+") do |file|
        file.puts un_sig_text
    end
    puts "post"
    puts un_sig_text
    key_hash = params["key_hash"]
    keys = [
        {
            :public_key_hash => "tz1i1zKCtCAPuAw1e6SuKEMXRcwhG5a78Ruo",
            :public_key => "edpkuuV16fGKAAZifZZqz52oX8LHfUh3smLywuzyrJkKGx1nXrTWcS",
            :private_key => "edsk3xkRt2oBvh5HJejNsGwKgSdc2QrCXGU4Deyj8MY9G9edQhdTsn"
        },
        # alice
        {
            :public_key_hash => "tz1amfhHn47i5ZYVnUGsTodsZW6G52vqAThE",
            :public_key => "edpkvJgayg1PDSC8PQhYHR2vC2QXfKkRrQe8BboAN9nU8ssNdARzWe",
            :private_key => "edsk2rTLCMy9DPkxsdECiZ1kp24n6ngSWQbFsa36D3RjK5F2GdsbgA"
        }
    ]
    for key in keys do
        if key[:public_key_hash] == key_hash
            # 找到私钥
            private_key = key[:private_key]
            @json = {
                # 签名算法
                :signature => sig(private_key,un_sig_text)
            }
            halt JSON @json
        end
    end
    "Key not found"
end

get '/authorized_keys' do
    headers \
        "Content-type" => "application/json" 
    "{}"
end