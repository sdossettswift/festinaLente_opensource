Rspec.configure do |configure|
  config.before(:suite) do
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do 
    DatabaseCleaner.strategy = :transaction
  end
  config.before(:each, :js => true) do 
    DatabaseCleaner.strategy = :truncation
  end
  config.after(:each) do 
    DatabaseCleaner.clean
  end
end
