module Sentry
  class StdoutTransport < Transport
    attr_accessor :events

    def initialize(*)
      super
    end

    def send_data(data, _options = {})
      unless configuration.sending_allowed?
        logger.debug("Event not sent: #{configuration.error_messages}")
      end

      $stdout.puts data
      $stdout.flush
    end
  end
end
