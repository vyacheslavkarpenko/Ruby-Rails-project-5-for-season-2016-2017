module API
  class Base < Grape::API
    require 'grape-swagger'

    prefix 'api'
    version 'v1', using: :path
    format :json

    mount API::V1::Base
    add_swagger_documentation
  end
end