require 'lib'

$0 = 'mizar'

begin
  require 'pry'
rescue LoadError
  require 'rubygems'
  require 'mizar'
end


ARGF.read