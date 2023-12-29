# frozen_string_literal: true
# This file was auto-generated by lib/tasks/web.rake

module Slack
  module Web
    module Api
      module Endpoints
        module AdminUsers
          #
          # Add an Enterprise user to a workspace.
          #
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [Object] :user_id
          #   The ID of the user to add to the workspace.
          # @option options [string] :channel_ids
          #   Comma separated values of channel IDs to add user in the new workspace.
          # @option options [boolean] :is_restricted
          #   True if user should be added to the workspace as a guest.
          # @option options [boolean] :is_ultra_restricted
          #   True if user should be added to the workspace as a single-channel guest.
          # @see https://api.slack.com/methods/admin.users.assign
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.assign.json
          def admin_users_assign(options = {})
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.assign', options)
          end

          #
          # Invite a user to a workspace.
          #
          # @option options [string] :channel_ids
          #   A comma-separated list of channel_ids for this user to join. At least one channel is required.
          # @option options [string] :email
          #   The email address of the person to invite.
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [string] :custom_message
          #   An optional message to send to the user in the invite email.
          # @option options [boolean] :email_password_policy_enabled
          #   Allow invited user to sign in via email and password. Only available for Enterprise Grid teams via admin invite.
          # @option options [string] :guest_expiration_ts
          #   Timestamp when guest account should be disabled. Only include this timestamp if you are inviting a guest user and you want their account to expire on a certain date.
          # @option options [boolean] :is_restricted
          #   Is this user a multi-channel guest user? (default: false).
          # @option options [boolean] :is_ultra_restricted
          #   Is this user a single channel guest user? (default: false).
          # @option options [string] :real_name
          #   Full name of the user.
          # @option options [boolean] :resend
          #   Allow this invite to be resent in the future if a user has not signed up yet. Resending can only be done via the UI and has no expiration. (default: false).
          # @see https://api.slack.com/methods/admin.users.invite
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.invite.json
          def admin_users_invite(options = {})
            raise ArgumentError, 'Required arguments :channel_ids missing' if options[:channel_ids].nil?
            raise ArgumentError, 'Required arguments :email missing' if options[:email].nil?
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            post('admin.users.invite', options)
          end

          #
          # List users on a workspace
          #
          # @option options [string] :cursor
          #   Set cursor to next_cursor returned by the previous call to list items in the next page.
          # @option options [integer] :limit
          #   Limit for how many users to be retrieved per page.
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace. The team_id is required if you use an org-level token.
          # @see https://api.slack.com/methods/admin.users.list
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.list.json
          def admin_users_list(options = {})
            if block_given?
              Pagination::Cursor.new(self, :admin_users_list, options).each do |page|
                yield page
              end
            else
              post('admin.users.list', options)
            end
          end

          #
          # Remove a user from a workspace.
          #
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [string] :user_id
          #   The ID of the user to remove.
          # @see https://api.slack.com/methods/admin.users.remove
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.remove.json
          def admin_users_remove(options = {})
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.remove', options)
          end

          #
          # Set an existing guest, regular user, or owner to be an admin user.
          #
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [string] :user_id
          #   The ID of the user to designate as an admin.
          # @see https://api.slack.com/methods/admin.users.setAdmin
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.setAdmin.json
          def admin_users_setAdmin(options = {})
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.setAdmin', options)
          end

          #
          # Set an expiration for a guest user
          #
          # @option options [integer] :expiration_ts
          #   Epoch timestamp in seconds when guest account should be disabled.
          # @option options [string] :user_id
          #   The ID of the user to set an expiration for.
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @see https://api.slack.com/methods/admin.users.setExpiration
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.setExpiration.json
          def admin_users_setExpiration(options = {})
            raise ArgumentError, 'Required arguments :expiration_ts missing' if options[:expiration_ts].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.setExpiration', options)
          end

          #
          # Set an existing guest, regular user, or admin user to be a workspace owner.
          #
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [Object] :user_id
          #   Id of the user to promote to owner.
          # @see https://api.slack.com/methods/admin.users.setOwner
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.setOwner.json
          def admin_users_setOwner(options = {})
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.setOwner', options)
          end

          #
          # Set an existing guest user, admin user, or owner to be a regular user.
          #
          # @option options [Object] :team_id
          #   The ID (T1234) of the workspace.
          # @option options [string] :user_id
          #   The ID of the user to designate as a regular user.
          # @see https://api.slack.com/methods/admin.users.setRegular
          # @see https://github.com/slack-ruby/slack-api-ref/blob/master/methods/admin.users/admin.users.setRegular.json
          def admin_users_setRegular(options = {})
            raise ArgumentError, 'Required arguments :team_id missing' if options[:team_id].nil?
            raise ArgumentError, 'Required arguments :user_id missing' if options[:user_id].nil?
            post('admin.users.setRegular', options)
          end
        end
      end
    end
  end
end
