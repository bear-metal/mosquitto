# encoding: utf-8

require 'test/unit'
require 'mosquitto'
require 'stringio'

Thread.abort_on_exception = true

class MosquittoTestCase < Test::Unit::TestCase
  undef_method :default_test if method_defined? :default_test

  if ENV['STRESS_GC']
    def setup
      GC.stress = true
    end

    def teardown
      GC.stress = false
    end
  end
end