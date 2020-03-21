# frozen_string_literal: true

module Api::V1
  class DataController < ApplicationController

    def index
      render json: { message: 'nothing here yet', success: true }, status: 200
    end

  end
end