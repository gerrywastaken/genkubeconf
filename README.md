# genkubeconf

Generate kubeconfig files simply

## Install via download (currently Linux only)

1. [download](https://github.com/gerrywastaken/genkubeconf/releases/latest)
2. extract: `tar -xf genkubeconf-linux.tar.gz; cd genkubeconf`
3. run: `./genkubeconf kube-proxy 127.0.0.1 system:kube-proxy --dry-run`

## Run via Docker

1. Create a Bash alias `alias genkubeconf="docker run -v $PWD/kubeconfigfiles:/app gerrywastaken/genkubeconf"`
2. `genkubeconf kube-proxy 127.0.0.1 system:kube-proxy`

## Run via Crystal

1. Install Crystal https://crystal-lang.org/install/
2. Download this code
3. Build `shards build genkubeconf`
4. Run `bin/genkubeconf --help`

## Usage

```shell
genkubeconf kube-proxy 127.0.0.1 system:kube-proxy
```

## Development

1. Install Crystal: https://crystal-lang.org/install/
2. Download this code and navigate to the directory
3. Make your change
4. Compile: `shards build --debug genkubeconf`
5. Test: `bin/genkubeconf --help`

## Contributing

1. Fork it (<https://github.com/gerrywastaken/genkubeconf/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Gerry](https://github.com/gerrywastaken) - creator and maintainer
