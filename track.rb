require './carrier/gso'

class Track

  def link(number,carrier)
    carrier_obj = carrier.new
    carrier_obj.tracking_number = trim_number(number)
    if carrier_obj.tracking_number?
      "#{carrier_obj.base_url}#{carrier_obj.tracking_path}"
    else
      nil
    end  
  end  

  def trim_number(number)
    number.strip
  end

end  

puts Track.new.link("77085071017342912945",Gso)