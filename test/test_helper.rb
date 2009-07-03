require 'rubygems'
require 'test/unit'

$LOAD_PATH.unshift(File.dirname(__FILE__))
$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))
require 'hit_me_back'

class Test::Unit::TestCase
end

class AppController
  attr_accessor :process_started, :notified_of_completion
  attr_accessor :notifier
  def initialize
    @process_started = false
    @notified_of_completion = false
  end
  
  def start_process
    @process_started = true
  end
  
  def process_completed(obj)
    @notified_of_completion = true
    @notifier = obj
  end
end

class BackgroundProcess  
  include HitMeBack
  attr_accessor :process_started, :notified_of_completion
  attr_accessor :name
  def initialize
    @process_started = false
    @notified_of_completion = false
  end

  def start_process
    @process_started = true
  end
  
  def process_completed
    @notified_of_completion = true
  end
end

class PlainClass
end