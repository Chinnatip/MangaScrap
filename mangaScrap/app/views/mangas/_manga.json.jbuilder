json.extract! manga, :id, :name, :chapter, :viewer, :source, :rating, :author, :created_at, :updated_at
json.url manga_url(manga, format: :json)