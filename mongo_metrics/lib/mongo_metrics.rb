require 'mongoid'
require 'mongo_metrics/engine'
require 'active_support/notifications'
require 'jquery-rails' # to fix https://github.com/rails/rails/commit/007f5670

module MongoMetrics
  EVENT = 'process_action.action_controller'

  ActiveSupport::Notifications.subscribe EVENT do |*args|
    MongoMetrics::Metric.store!(args) unless mute?
  end

  def self.mute!
    Thread.current['sql_metrics.mute'] = true
    yield
  ensure
    Thread.current['sql_metrics.mute'] = false
  end

  def self.mute?
    Thread.current['sql_metrics.mute'] || false
  end
end
