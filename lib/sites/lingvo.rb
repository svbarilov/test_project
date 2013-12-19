require 'rubygems'
require "bundler/setup"
require 'taza'
require 'before_helpers'


module Lingvo
  include ForwardInitialization

  class Lingvo < ::Taza::Site  #Automatically loads all files

  end
end


