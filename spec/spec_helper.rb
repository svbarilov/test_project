ENV['TAZA_ENV'] = "qa" if ENV['TAZA_ENV'].nil?

lib_path = File.expand_path("#{File.dirname(__FILE__)}/../lib/")
$LOAD_PATH.unshift lib_path unless $LOAD_PATH.include?(lib_path)

require 'rubygems'
require 'rspec'
require 'mocha'
require 'test_xml/spec'
require 'hpricot'
require 'active_record'
require 'sys/proctable'
require "watir-webdriver"



$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__)))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib/sites"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../config"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../db"))
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../db/schemas"))




#----mediascape helpers----
$LOAD_PATH.unshift File.expand_path(File.join(File.dirname(__FILE__), "/../lib/sites/lingvo/helpers"))


# generationg timestamp (we'll have available in all tests)
def timestamp
  time_formated = Time.now.to_i.to_s.reverse.chop.chop.chop.reverse.to_i
  return time_formated.to_s
end


