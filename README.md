# Docker Oauth Device Proxy

Kleiner Docker Container zum testen des OAuth 2.0 Device Flows

[Draft](https://datatracker.ietf.org/doc/html/draft-ietf-oauth-device-flow-13)

Zum starten
------------

docker-compose.yml auf die entsprechende Umgebung Anpassen:

```
AUTHORIZATION_ENDPOINT: https://PASSPORT-HOST/oauth/authorize
TOKEN_ENDPOINT: https://PASSPORT-HOST/oauth/token
```

Danach

```
docker-compose up -d
```

Further
------------
Weitere Hilfestellungen in der README-PROXY.md