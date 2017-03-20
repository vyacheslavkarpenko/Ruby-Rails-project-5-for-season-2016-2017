module API
  module V1
    class Base < Grape::API
      mount User
    end
  end
end