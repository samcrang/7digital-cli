7digital CLI
============

[![Build Status](https://travis-ci.org/samcrang/7digital-cli.svg?branch=master)](https://travis-ci.org/samcrang/7digital-cli)

A command-line tool for interacting with the 7digital API.

Installation
------------

Currently in pre-release, you can store the latest build from RubyGems:

```
gem install 7d --pre
```

You'll need to set the following environment variables:

```
SEVENDIGITAL_CONSUMER_KEY
SEVENDIGITAL_CONSUMER_SECRET
SEVENDIGITAL_TOKEN
SEVENDIGITAL_TOKEN_SECRET
```

Usage
-----

```
$ SEVENDIGITAL_CONSUMER_KEY='YOUR_KEY_HERE' SEVENDIGITAL_CONSUMER_SECRET='YOUR_SECRET_HERE' 7d sign clip --trackid=1234
```

Other than just being able to sign calls to 7digital endpoints you might find it useful to pipe the ouput around–here we are using it to measure the time to first byte for multiple requests:

```
$ seq 10 | xargs -I z 7d sign clip --trackid=1234 | xargs -n 1 curl -so /dev/null --write-out "Status: %{http_code}, TTFB: %{time_starttransfer}\n"
```
