# Notes for Linux

## Qemu and dependencies installation

Run the following on the host machine:

```bash
source ./host_setup.sh
```

## X Forwarding notes

- Connect to the virtual machine using:

```bash
vagrant ssh -- -Y
```

- Run Mininet as:

```bash
sudo -E mn [--topo=minimal] -x
```

- The usual terminal command ```xterm <node>```does not work. Instead, use:

```bash
<node> xterm&
```
