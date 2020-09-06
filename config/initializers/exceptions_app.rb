Rails.application.configure do
  config.exceptions_app = ->(env) do
    request = ActionDispatch::Request.new(env)

    action =
      case request.path_info
      when "/404"; :not_found
      when "/422"; :unprocessable_entity
      else; :internal_server_error
      end

    ErrorsController.action(action).call(env)
  end
end

# ルーティング処理の段階で発生する例外を補足する為のちょっとした工夫らしい
    
