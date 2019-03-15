class EmailCheckerController < ApplicationController
  include EmailChecker
  def check
    if valid_mail?(params['email'])
      render json: {message: "email #{params['email']} exist"}, status: 200
    else
      render json: {message: "email #{params['email']} doesn't exist"}, status: :not_found
    end
  end
end
