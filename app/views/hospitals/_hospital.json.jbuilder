json.extract! hospital, :id, :name, :street, :city, :state, :contact_id, :created_at, :updated_at
json.url hospital_url(hospital, format: :json)
