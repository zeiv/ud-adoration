require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'
require 'clockwork/database_events'
require 'clockwork/database_events/manager'

module Clockwork
  # required to enable database syncing support
  Clockwork.manager = DatabaseEvents::Manager.new

  sync_database_events model: TimeSlot, every: 2.minute do |time_slot|
    # Send emails with Resque
    time_slot.queue_reminder
  end
end