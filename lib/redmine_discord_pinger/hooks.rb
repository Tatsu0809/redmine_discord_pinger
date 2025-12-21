module RedmineDiscordPinger
  class Hooks < Redmine::Hook::ViewListener
    render_on :view_issues_show_details_bottom, :partial => 'hooks/view_issues_edit_notes_bottom'
  end
end
