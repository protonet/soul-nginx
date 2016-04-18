# Testing branch for mod_zip integration

  1. Build demo rack app and nginx from local checkout with `docker-compose build && docker-compose up`
  2. `wget localhost:5000/anypathwilldo -O tmp.zip`

# Soul Nginx [![Build Status](https://travis-ci.com/protonet/soul-nginx.svg?token=aANFMeZWXsUEFNSVHTqz)](https://travis-ci.com/protonet/soul-nginx)

  * [Source Code](https://github.com/protonet/soul-nginx)
  * [Continuous Integration](https://travis-ci.com/protonet/soul-nginx)
  * [Docker Repository](https://hub.docker.com/r/experimentalplatform/soul-nginx/)

**The nginx reverse proxy for gluing together our dockerized soul services into one coherent webservice**

## Sources

  * http://nginx.org/en/download.html
  * https://github.com/evanmiller/mod_zip

