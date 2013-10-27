require 'test_helper'

class RenderingTest < ActionDispatch::IntegrationTest
  test '.rb template handler' do
    get '/handlers/rb_handler'
    expected = "This is my first <b>template handler</b>!"
    assert_match expected, response.body
  end

  test '.string template handler' do
    get '/handlers/string_handler'
    expected = "Congratulations! You just created another template handler!"
    assert_match expected, response.body
  end

  test '.md template handler' do
    get '/handlers/kramdown'
    expected = "<p>Kramdown is <em>cool</em> and <strong>pure ruby</strong>!</p>"
    assert_match expected, response.body
  end

  test '.merb template handler' do
    get '/handlers/merb'
    expected = "<p>MERB template handler is <strong>cool and fast</strong>!"
    assert_match expected, response.body
  end

  test 'dual templates with .merb' do
    email = Notifier.contact('you@example.com')
    assert_equal 2, email.parts.size
    assert_equal 'multipart/alternative', email.mime_type

    assert_equal 'text/plain', email.parts[0].mime_type
    assert_equal 'Dual templates **rocks**!', email.parts[0].body.encoded.strip

    assert_equal 'text/html', email.parts[1].mime_type
    assert_equal '<p>Dual templates <strong>rocks</strong>!</p>', email.parts[1].body.encoded.strip
  end
end
