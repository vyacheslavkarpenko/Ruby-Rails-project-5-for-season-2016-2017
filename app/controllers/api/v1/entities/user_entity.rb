module API
  module V1
    module Entities
      class UserEntity < Grape::Entity
        format_with(:iso_timestamp) { |dt| dt.iso8601  }

        expose :id
        expose :first_name
        expose :last_name
        expose :phone
        expose :email
        expose :password_digest
        expose :auth_token

        with_options(format_with: :iso_timestamp) do
          expose :created_at
          expose :updated_at
        end
      end
    end
  end
end
