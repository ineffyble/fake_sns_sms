require "sinatra/base"

module FakeSnsSms
  class Server < Sinatra::Base
    get '*' do
      status 501
      'Not implemented'
    end

    post '*' do
      unless params[:Action] == "Publish"
        status 501
        'Not implemented'
      end
      if FakeSnsSms::is_valid_sms?(params)
        status 200
        'Published'
      else
        status 400
        'Bad request'
      end
    end
  end
end
