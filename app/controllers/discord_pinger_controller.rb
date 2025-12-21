require 'net/http'
require 'uri'
require 'json'

class DiscordPingerController < ApplicationController
  before_action :find_issue, :authorize

  def send_msg
    webhook_url = Setting.plugin_redmine_discord_pinger['webhook_url']
    if webhook_url.blank?
      render json: { status: 'error', message: 'Webhook URLが未設定です。' }, status: 400
      return
    end

    user_name = User.current.name
    full_message = "#{user_name}が作業中です。\n#{@issue.subject} #{issue_url(@issue)}"
    
    begin
      uri = URI.parse(webhook_url)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true

      request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/json'})
      request.body = { content: full_message }.to_json

      response = http.request(request)
      
      if response.code.to_i == 204 || response.code.to_i == 200
        render json: { status: 'ok', message: 'Discordに通知しました。' }
      else
        render json: { status: 'error', message: "送信失敗: #{response.code}" }, status: 500
      end
    rescue => e
      render json: { status: 'error', message: e.message }, status: 500
    end
  end

  private

  def find_issue
    @issue = Issue.find(params[:issue_id])
    @project = @issue.project
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
