json.extract! reeview, :id, :rating, :comment, :created_at, :updated_at
json.url reeview_url(reeview, format: :json)