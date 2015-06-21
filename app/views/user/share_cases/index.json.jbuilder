json.array!(@rent_cases) do |rent_case|
  json.extract! rent_case, :id
  json.url rent_case_url(rent_case, format: :json)
end
