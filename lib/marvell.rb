Dir[File.dirname(__FILE__) + '/marvell/*.rb'].each do |file|
  require file
end

class String
  def camel_case
    self.split('_').inject([]){ |buffer,e| buffer.push(buffer.empty? ? e : e.capitalize) }.join
  end
end
