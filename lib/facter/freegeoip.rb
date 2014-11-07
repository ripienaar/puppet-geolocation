require 'json'
require 'open-uri'
require 'timeout'

begin
  Timeout::timeout(2) do
    geoipinfo = JSON.parse(open("http://freegeoip.net/json/").read)

    geoipinfo.each do |k, v|
      next if k == "ip"
      Facter.add("geo_#{k.downcase}") { setcode { v } }
    end
  end
rescue Exception => e
  Facter.debug("Could not resolve location via freegeoip.net: %s" % e.to_s)
end
