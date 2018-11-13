require "json"
require "pp"
require 'sinatra'

require 'sinatra'
port = ARGV[0]
set :bind, '0.0.0.0'
set :port, port
set :root, File.dirname(__FILE__)

# before do
#     pp "haha"
#     if request.request_method == "POST"
#         body_parameters = request.body.read
#         params.merge!(JSON.parse(body_parameters))
#     end
# end

post '/' do
    # headers \
    #     "Content-type" => "application/json"
    
    content_type :json
    # JSON  params
    @json = JSON.parse(request.body.read)
    pp @json
    "#{@json}"
end