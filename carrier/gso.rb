class Gso
  attr_accessor :tracking_number

  def base_url
    "https://www.gso.com/"
  end

  def tracking_path
    "Trackshipment?TrackingNumbers=#{tracking_number}"
  end
    
  def tracking_number?
    tracking_number.scan(/770850[0-9]{3}173[0-9]{8}/).first.eql? tracking_number
  end
end
