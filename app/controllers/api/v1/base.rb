module API
  module V1
    class Base < Grape::API
      mount UserAPI
    end
  end
end