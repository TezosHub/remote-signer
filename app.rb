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
# before do
#     pp "haha"
#     if request.request_method == "POST"
#         body_parameters = request.body.read
#         params.merge!(JSON.parse(body_parameters))
#     end
# end

# post '/' do
#     # headers \
#     #     "Content-type" => "application/json"
    
#     content_type :json
#     # JSON  params
#     @json = JSON.parse(request.body.read)
#     pp @json
#     "#{@json}"
# end

get '/' do
    @title = "remote signer"
    text = "### how to use\n ``` curl http://localhost:2323 -X POST -d 'sometext' ```"
    @md = markdown(text)
    erb :index
end

post '/' do
    text = request.body.read
    time = Time.now
    File.open("data/#{time}.txt","w+") do |file|
        file.puts text
    end
    "#{text}"
end