What?
=====

A custom fact that queries http://freegeoip.net/ for the machines location

```
geo_area_code => unknown
geo_city => Amsterdam
geo_country_code => NL
geo_country_name => Netherlands
geo_latitude => 52.35
geo_longitude => 4.9167
geo_metro_code => unknown
geo_region_code => 07
geo_region_name => Noord-Holland
geo_zipcode => unknown
```

freegeoip.net will return a lot of information when available, but as you can
see above when some part is not available we show ```unknown```

Status?
-------

Since this fact queries a remote service you probably do not want
to install it on sensitive machines, or 1000s of machines at a time.

You could consider hosting your own instance of the app though, the source
is @ https://github.com/fiorix/freegeoip

The fact writes a cache into your OS temp directory and if the file exist
on a future run it will just read that and not query the Remote API.  On
my machine that is ```/tmp/freegeoip_facter.pstore```.

Facter does not really have a way for facts to have configuration so the
url for the freegeoip service is hard coded and the tempdir is whatever
your system sets via ruby's tempdir module. So ths will work on windows
or unix and honor things like TMPDIR environment variables.

Contact?
--------

R.I.Pienaar / rip@devco.net / @ripienaar / http://devco.net
