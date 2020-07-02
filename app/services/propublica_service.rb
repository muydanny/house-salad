class PropublicaService

  def members_of_house(state)
    
    response = conn.get("/congress/v1/members/house/#{state}/current.json")
    parsed_response = JSON.parse(response.body, symbolize_names: true)
  end
  
  def conn 
    @conn ||= Faraday.new(url: "https://api.propublica.org") do |req|
      req.headers["X-API-Key"] = ENV["PROPUBLICA_API_KEY"]
      req.adapter Faraday.default_adapter
    end
    @conn
  end
end