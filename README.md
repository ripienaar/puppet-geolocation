What?
=====

A custom fact that queries http://freegeoip.net/ for the machines location

```
geo_country_code => GB
geo_country_name => United Kingdom
geo_latitude => 51.5
geo_longitude => -0.13
```

Status?
-------

Since this fact queries a remote service you probably do not want
to install it on sensitive machines, or 1000s of machines at a time.

I'll add some caching to it at some point to make it more suitable
for larger installs

Contact?
--------

R.I.Pienaar / rip@devco.net / @ripienaar / http://devco.net
