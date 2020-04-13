# frozen_string_literal: true

class Mentor
  attr_accessor :name, :surname, :notification

  def initialize(name:, surname:)
    @name = name
    @surname = surname
    @notification = notification
    @list_of_notifications = []
  end

  def add_notification
    @list_of_notifications << @notification
  end

  def read_notifications!
    @list_of_notifications.delete(@notification)
  end
end
