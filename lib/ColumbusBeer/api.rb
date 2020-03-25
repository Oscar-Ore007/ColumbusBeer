class ColumbusBeer::API
    def self.get_beers 
        url = "https://api.punkapi.com/v2/beers?per_page=10"
        response = HTTParty.get(url)
        response.each do |b|
            name = b["name"]
            description = b["description"]
            ColumbusBeer::Beers.new(name,description)
        end 
    end 
end 
