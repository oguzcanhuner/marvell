Dir[File.dirname(__FILE__) + '/marvel/*.rb'].each do |file|
  require file
end

module Marvel
  def self.new(params)
    @client = Marvel::Client.new(params)
  end
end
