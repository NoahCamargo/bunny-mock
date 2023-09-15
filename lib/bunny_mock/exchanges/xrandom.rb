# frozen_string_literal: true
module BunnyMock
  module Exchanges
    class Xrandom < BunnyMock::Exchange
      #
      # API
      #

      ##
      # Deliver a message to route with xrandom key match
      #
      # @param [Object] payload Message content
      # @param [Hash] opts Message properties
      # @param [String] key Routing key
      #
      # @api public
      #
      def deliver(payload, opts, key)
        @routes.values.flatten.sample(1).each { |destination| destination.publish(payload, opts) }
      end
    end
  end
end
