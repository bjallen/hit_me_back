require 'test_helper'

class HitMeBackTest < Test::Unit::TestCase
  
  def setup
    @ac = AppController.new
    @bp = BackgroundProcess.new
  end
  
  def test_for_addition_of_module_methods
    x = PlainClass.new
    methods_to_check_for = ['events','add_listener','remove_listener','notify_listeners']   
    common_methods_before = methods_to_check_for & x.methods  
    x.extend(HitMeBack)   
    common_methods_after = methods_to_check_for & x.methods   
    assert_equal common_methods_after.size, common_methods_before.size + methods_to_check_for.size
  end
  
  def test_for_ability_to_add_an_event
    @bp.add_listener(:something_happened, @ac)
    assert !@bp.events.find { |x| x.name == :something_happened }.nil?
  end
  
  def test_for_ability_to_add_listener
    @bp.add_listener(:something_happened, @ac)
    event = @bp.events.find { |x| x.name == :something_happened }
    flunk 'the event called :something_happened was not found' if event.nil?
    listeners = event.listeners.find_all { |x| x.class == AppController }
    assert_equal listeners.size, 1
  end
  
  def test_for_ability_to_remove_listener
    @bp.add_listener(:something_happened, @ac)
    @bp.remove_listener(:something_happened, @ac)
    event = @bp.events.find { |x| x.name == :something_happened }
    flunk 'the event called :something_happened was not found' if event.nil?
    listeners = event.listeners.find_all { |x| x.class == AppController }
    assert_equal listeners.size, 0
  end
  
  def test_that_correct_method_is_called_on_listener
    @bp.add_listener(:something_happened, @ac)
    @bp.add_listener(:process_completed, @ac)
    flunk 'the notified flag was true too early' if @ac.notified_of_completion
    @bp.notify_listeners(:something_happened)
    flunk 'the notified flag was set for the wrong event' if @ac.notified_of_completion
    @bp.notify_listeners(:process_completed)
    assert @ac.notified_of_completion
  end
  
  def test_that_the_notifier_is_passed_to_the_listener
    @bp.name = 'my process 1234'
    @bp.add_listener(:process_completed, @ac)
    @bp.notify_listeners(:process_completed)
    assert_equal @ac.notifier.name, 'my process 1234'
  end
  
end
