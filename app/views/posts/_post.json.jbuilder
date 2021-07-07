json.extract! post, :id, :title, :desc, :html, name, :created_at, :updated_at
json.url post_url(post, format: :json)
