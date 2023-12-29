# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module Oauth
          #
          # Exchanges a temporary OAuth verifier code for an access token.
          #
          # @option options [string] :client_id
          #   Issued when you created your application.
          # @option options [string] :client_secret
          #   Issued when you created your application.
          # @option options [string] :code
          #   The code param returned via the OAuth callback.
          # @option options [string] :redirect_uri
          #   This must match the originally submitted URI (if one was sent).
          # @option options [boolean] :single_channel
          #   Request the user to add your app only to a single channel. Only valid with a legacy workspace app.
          # @see https://api.slack.com/methods/oauth.access
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/oauth/oauth.access.json
          def oauth_access(options = {})
            post('oauth.access', options)
          end
        end
      end
    end
  end
end