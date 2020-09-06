Rails.application.configure do
  config.action_view.form_with_generates_remote_forms = false
end
# リモートフォームではなく普通のフォームを作る設定