7digital CLI
============

[![Build Status](https://travis-ci.org/samcrang/7digital-cli.svg?branch=master)](https://travis-ci.org/samcrang/7digital-cli)

A command-line tool for interacting with the 7digital API.

Installation
------------

```
bundle
bin/7d
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

Until I get round to bundling this up as a gem you'll need to invoke the executable from within the repo:

```
$ SEVENDIGITAL_CONSUMER_KEY='YOUR_KEY_HERE' SEVENDIGITAL_CONSUMER_SECRET='YOUR_SECRET_HERE' bin/7d sign clip 1234
```

Other than just being able to sign calls to 7digital endpoints you might find it useful to pipe the ouput around–here we are using it to measure the time to first byte for multiple requests:

```
$ seq 10 | xargs -I z bin/7d sign clip 1234 | xargs -n 1 curl -so /dev/null --write-out "Status: %{http_code}, TTFB: %{time_starttransfer}\n"
```
