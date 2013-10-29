class LiveAssetsController < ActionController::Base
  include ActionController::Live

  def hello
    while true
      response.stream.write 'Hello World\n'
      sleep 1
    end
  rescue IOError
    puts 'hello streamming connection closed.'
    response.stream.close
  end

  def sse
    response.headers['Cache-Control'] = 'no-cache'
    response.headers['Content-Type']  = 'text/event-stream'

    sse = LiveAssets::SSESubscriber.new
    sse.each { |msg| response.stream.write msg }

    while true
      response.stream.write "event: reloadCSS\ndata: {}\n\n"
      sleep 1
    end
  rescue IOError
    sse.close
    response.stream.close
    puts 'sse streamming connection closed.'
  end
end
