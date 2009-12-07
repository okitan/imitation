require 'spec'
begin
  require 'rr'
rescue LoadError
  require 'rubygems'
  require 'rr'
end
require File.join(File.dirname(__FILE__), %w[ .. lib imitation])

Spec::Runner.configure do |config|
  config.mock_with :rr
end
