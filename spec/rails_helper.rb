require 'shoulda/matchers'

Shoulda:Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
  config.use_transactional_fixtures = false
end
