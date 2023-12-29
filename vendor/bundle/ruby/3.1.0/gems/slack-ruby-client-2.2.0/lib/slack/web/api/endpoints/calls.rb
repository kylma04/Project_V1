# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Calls
          #
          # Registers a new Call.
          #
          # @option options [string] :external_unique_id
          #   An ID supplied by the 3rd-party Call provider. It must be unique across all Calls from that service.
          # @option options [string] :join_url
          #   The URL required for a client to join the Call.
          # @option options [string] :created_by
          #   The valid Slack user ID of the user who created this Call. When this method is called with a user token, the created_by field is optional and defaults to the authed user of the token. Otherwise, the field is required.
          # @option options [integer] :date_start
          #   Unix timestamp of the call start time.
          # @option options [string] :desktop_app_join_url
          #   When supplied, available Slack clients will attempt to directly launch the 3rd-party Call with this URL.
          # @option options [string] :external_display_id
          #   An optional, human-readable ID supplied by the 3rd-party Call provider. If supplied, this ID will be displayed in the Call object.
          # @option options [string] :title
          #   The name of the Call.
          # @option options [array] :users
          #   The list of users to register as participants in the Call. Read more on how to specify users here.
          # @see https://api.slack.com/methods/calls.add
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/calls/calls.add.json
          def calls_add(options = {})
            raise ArgumentError, 'Required arguments :external_unique_id missing' if options[:external_unique_id].nil?
            raise ArgumentError, 'Required arguments :join_url missing' if options[:join_url].nil?
            post('calls.add', options)
          end

          #
          # Ends a Call.
          #
          # @option options [string] :id
          #   id returned when registering the call using the calls.add method.
          # @option options [integer] :duration
          #   Call duration in seconds.
          # @see https://api.slack.com/methods/calls.end
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/calls/calls.end.json
          def calls_end(options = {})
            raise ArgumentError, 'Required arguments :id missing' if options[:id].nil?
            post('calls.end', options)
          end

          #
          # Returns information about a Call.
          #
          # @option options [string] :id
          #   id of the Call returned by the calls.add method.
          # @see https://api.slack.com/methods/calls.info
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/calls/calls.info.json
          def calls_info(options = {})
            raise ArgumentError, 'Required arguments :id missing' if options[:id].nil?
            post('calls.info', options)
          end

          #
          # Updates information about a Call.
          #
          # @option options [string] :id
          #   id returned by the calls.add method.
          # @option options [string] :desktop_app_join_url
          #   When supplied, available Slack clients will attempt to directly launch the 3rd-party Call with this URL.
          # @option options [string] :join_url
          #   The URL required for a client to join the Call.
          # @option options [string] :title
          #   The name of the Call.
          # @see https://api.slack.com/methods/calls.update
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/calls/calls.update.json
          def calls_update(options = {})
            raise ArgumentError, 'Required arguments :id missing' if options[:id].nil?
            post('calls.update', options)
          end
        end
      end
    end
  end
end
