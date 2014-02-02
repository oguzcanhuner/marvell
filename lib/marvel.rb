Dir[File.dirname(__FILE__) + '/marvel/*.rb'].each do |file|
  require file
end
