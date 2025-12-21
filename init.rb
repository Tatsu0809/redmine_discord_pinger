require 'redmine'
require File.expand_path('../lib/redmine_discord_pinger/hooks', __FILE__)

Redmine::Plugin.register :redmine_discord_pinger do
  name 'Redmine Discord Pinger Plugin'
  author 'Tatsu0809'
  description 'Adds an Audit button to issue comments to send a notification to Discord.'
  version '0.0.1'
  
  settings :default => {
    'webhook_url' => ''
  }, :partial => 'settings/discord_pinger_settings'
  project_module :issue_tracking do
    permission :audit_discord, {:discord_pinger => [:send_msg]}, :require => :member
  end
end
