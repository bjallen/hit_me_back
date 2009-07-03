module HitMeBack
  
  attr_accessor :events
  
  def add_listener(event_name, listener)
    @events = [] if @events.nil?
    matching_events = @events.find_all { |event| event.name == event_name }

    if matching_events.empty?
      @events << Event.new(event_name, listener)
    else
      matching_events.first.listeners << listener
    end
  end
  
  def remove_listener(event_name, listener)
    event = @events.find { |x| x.name == event_name }
    event.listeners.reject! { |x| x == listener } unless event.nil?
  end
  
  def notify_listeners(event_name)
    event = @events.find { |x| x.name == event_name }
    event.listeners.each do |listener|
      listener.send(event.name, self) if listener.respond_to?(event.name)
    end unless event.nil?
  end
end

require 'hit_me_back/event'