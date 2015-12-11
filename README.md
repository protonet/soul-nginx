# Soul Nginx [![Build Status](https://travis-ci.com/protonet/soul-nginx.svg?token=aANFMeZWXsUEFNSVHTqz)](https://travis-ci.com/protonet/soul-nginx)

  * [Source Code](https://github.com/protonet/soul-nginx)
  * [Continuous Integration](https://travis-ci.com/protonet/soul-nginx)
  * [Docker Repository](https://hub.docker.com/r/experimentalplatform/soul-nginx/)

**The nginx configuration for gluing together our dockerized soul services into one webservice**

This simply takes the main nginx docker image, bakes in the `nginx.conf` from this repo and puts it onto docker hub.

You can find the legacy HTTP stack configs from our Ubuntu-based boxes on [this wiki page](https://github.com/protonet/german-shepherd/wiki/HTTP-Proxy-Stack).
