require 'json'
require 'open-uri'
require 'timeout'
require 'pstore'
require 'tmpdir'

def geoip_cached_fetch
  store = PStore.new(File.join(Dir.tmpdir, "freegeoip_facter.pstore"))

  data = store.transaction { store[:freegeoip] }

  unless data
    data = store.transaction do
      store[:freegeoip] = JSON.parse(open("http://freegeoip.net/json/").read)
    end
  end

  data
end

begin
  Timeout::timeout(5) do
    geoipinfo = nil

    ["country_code", "country_name", "region_code", "region_name", "city", "zipcode", "latitude", "longitude", "metro_code", "area_code"].each do |key|
      Facter.add("geo_#{key.downcase}") do
        setcode do
          geoipinfo ||= geoip_cached_fetch

          ["", nil].include?(geoipinfo[key]) ? "unknown" : geoipinfo[key]
        end
      end
    end
  end
rescue Exception => e
  Facter.debug("Could not resolve location via freegeoip.net: %s" % e.to_s)
end
