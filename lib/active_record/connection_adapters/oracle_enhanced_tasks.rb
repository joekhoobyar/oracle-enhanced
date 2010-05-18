# implementation idea taken from JDBC adapter
if defined?(Rake.application) and Rake.application and
  (ActiveRecord::Base.configurations[Rails.env].nil? or
      ActiveRecord::Base.configurations[Rails.env]['adapter'] == 'oracle_enhanced')
then
  oracle_enhanced_rakefile = File.dirname(__FILE__) + "/oracle_enhanced.rake"
  if Rake.application.lookup("environment")
    # rails tasks already defined; load the override tasks now
    load oracle_enhanced_rakefile
  elsif ActiveRecord::Base.configurations[Rails.env]
    # rails tasks not loaded yet; load as an import
    Rake.application.add_import(oracle_enhanced_rakefile)
  end
end
