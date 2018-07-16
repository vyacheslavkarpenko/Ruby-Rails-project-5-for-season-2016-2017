# frozen_string_literal: true

Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  mount API::Base => '/'
  mount GrapeSwaggerRails::Engine => '/swagger'
end
