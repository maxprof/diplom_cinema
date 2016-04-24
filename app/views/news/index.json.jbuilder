json.array!(@news) do |news|
  json.extract! news, :id, :title, :description, :user_id
  json.url news_url(news, format: :json)
end
