class LiveAssetsController < ActionController::Base
  include ActionController::Live

  def hello
    while true
      response.stream.write 'Hello World\n'
      sleep 1
    end
  rescue IOError
    puts 'Streamming connection closed by client.'
    response.stream.close
  end
end
