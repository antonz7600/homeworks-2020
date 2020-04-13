# frozen_string_literal: true

# this module is a subject's interface

module Observable
  def initialize
    @observers = []
  end

  def add_observer(observer)
    @observers << observer unless @observers.include?(observer)
  end

  def delete_observer(observer)
    @observers.delete(observer)
  end

  def notify_observers
    @observers.each { |x| x.update(self) }
  end
end
