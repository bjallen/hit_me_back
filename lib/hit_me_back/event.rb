module HitMeBack
  class Event
    attr_accessor :name, :listeners
    def initialize(name, obj)
      @name = name
      @listeners = []
      @listeners << obj
    end
  end
end