json.array!(@volunteers) do |volunteer|
  json.extract! volunteer, :id, :email, :first_name, :last_name, :zip_code
  json.url volunteer_url(volunteer, format: :json)
end
