# Wasm Doom

This is a [Chocolate Doom][1] WebAssembly port with WebSockets [support][4].

## Running with Docker
This fork can be run with [Docker and Docker Compose](https://www.docker.com/products/docker-desktop). If in the root directory, you can simply run `docker-compose up` to use our existing image. If you wish to build and run your own image, you can run `docker build .` then `docker run -p 8000:8000 [sha from previous step]`.
## Running manually
### Requirements

You need to install Emscripten and a few other tools first:

```
brew install emscripten
brew install automake
brew install sdl2 sdl2_mixer sdl2_net
```

### Compiling

There are two scripts to facilitate compiling Wasm Doom:

```
./scripts/clean.sh
./scripts/build.sh
```

### Running

Copy the shareware version of [doom1.wad][3] to [./src][9] (make sure it has the name doom1.wad)

Then:

```
cd src
python -m SimpleHTTPServer
```

Then open your browser and point it to http://0.0.0.0:8000/

Doom should start (local mode, no network). Check [doom-workers][8] if you want to run multiplayer locally.

Inspect [src/index.html][6] for startup details.

Check our live multiplayer [demo][5] and [blog post][7].

### stdout procotol

To show important messages coming from the game while it's running we send the following formatted stdout messages, which can be parsed in the web page running the wasm:

```
doom: 1, failed to connect to websockets server
doom: 2, connected to %s
doom: 3, we're out of client addresses
doom: 4, ws error(eventType=%d, userData=%d)
doom: 5, ws close(eventType=%d, wasClean=%d, code=%d, reason=%s, userData=%d)
doom: 6, failed to send ws packet, reconnecting
doom: 7, failed to connect to %s
doom: 8, uid is %d
doom: 9, disconnected from server
doom: 10, game started
doom: 11, entering fullscreen
doom: 12, client '%s' timed out and disconnected
```

## License

Chocolate Doom and this port are distributed under the GNU GPL. See the COPYING file for more information.

[1]: https://github.com/chocolate-doom/chocolate-doom
[2]: https://emscripten.org/
[3]: https://doomwiki.org/wiki/DOOM1.WAD
[4]: src/net_websockets.c
[5]: https://silentspacemarine.com
[6]: src/index.html
[7]: https://blog.cloudflare.com/doom-multiplayer-workers
[8]: https://github.com/cloudflare/doom-workers
[9]: src
