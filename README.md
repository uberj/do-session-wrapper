Script to startup Digital Ocean droplet on demand to save on idle costs.


```
brew install doctl
doctl auth init --context auto-startup-shutdown-command
<enter api key>

cp .config-example .config
vim .config # Set vars
```

Usage:
```
./remotesession.sh
> Starging droplet
> droplet not active

... (wait for droplet to start) ...

> droplet active
> starting session

(ssh session happens here. ^D to end the session)

> session over. stopping droplet
> droplet active

... (waiting for droplet to stop) ...

> droplet active
> droplet not active
> done
```
