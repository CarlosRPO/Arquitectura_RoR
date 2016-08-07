json.extract! session_log, :id, :user_name, :logged_date, :success, :error_message, :created_at, :updated_at
json.url session_log_url(session_log, format: :json)