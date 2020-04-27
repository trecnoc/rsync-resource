# Rsync Resource

Concourse resource for persisting build artifacts on a shared storage location with rsync and ssh.

## Source Configuration

* `server`: *Required.* The server to rsync to.

* `username`: *Required.* User credential for login using ssh.

* `private_key`: *Required.* Key for the specified user.

* `base_dir`: *Required.* Base directory in which to place the artifacts.

## Behavior

### `check`: NOOP.

### `in`: NOOP.

### `out`: Transfer files to server.

Transfer artifacts in `base_dir` on `server` using the specified user credentials.

#### Parameters

* `sub_dir`: *Optional.* Directory to be sync'd. If specified limit the directory
to be sync'd to sync_dir. If not specified everything in the put will be sent
(which could include container resources, whole build trees etc.)

## Example Configuration

``` yaml
- name: release
  type: resync
  source:
    server: 127.0.0.1
    username: user
    private_key: |
      ...
    base_dir: /data/temp
```

### Plan

``` yaml
- put: release
```

## Contributing

Please make all pull requests to the `master` branch and ensure tests pass
locally.
