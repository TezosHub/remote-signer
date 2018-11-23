require "json"
require "pp"
require 'sinatra'
# require 'rack/ssl'
# use Rack::SSL

port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port
set :root, File.dirname(__FILE__)
set :public_folder, Proc.new { File.join(root, "static") }
set :views, Proc.new { File.join(root, "view") }

json = File.read('keys.json')
keys = JSON.parse(json)

def sig(private_key,un_sig_text,key_hash)
    @out = ""
    cmd = "node sig.js #{un_sig_text} '#{key_hash}'"
    puts cmd
    IO.popen(cmd) do |f|
        begin
        line = f.gets
        @out = "#{@out}#{line}".chomp
        end while line!=nil
    end
    pp @out
    @out
end

get '/' do
    erb :index
end



get '/keys/:pkh' do
    headers \
        "Content-type" => "application/json"
    pkh = params["pkh"]
    for key in keys do
        if key["pkh"] == pkh
            pk = key["pk"]
            @json = {
                :public_key => pk
            }
            halt JSON @json
        end
    end
    "Key not found"
end

post '/keys/:pkh' do
    headers \
        "Content-type" => "application/json"
    un_sig_text = request.body.read.chomp

    time = Time.now.to_i
    File.open("data/#{time}.txt","w+") do |file|
        file.puts un_sig_text
    end
    puts "post"
    puts un_sig_text
    pkh = params["pkh"]
    for key in keys do
        if key["pkh"] == pkh
            # 找到私钥
            sk = key["sk"]
            @json = {
                # 签名算法
                :signature => sig(sk,un_sig_text,pkh)
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