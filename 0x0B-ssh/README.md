# SSH

## Project Highlights
* What is a server
* Where servers usually live
* What is SSH
* How to create an SSH RSA key pair
* How to connect to a remote host using an SSH RSA key pair
* The advantage of using #!/usr/bin/env bash instead of /bin/bash

## Tasks :page_with_curl:

* **0. Use a private key**
  * [0-use_a_private_key](./0-use_a_private_key): Bash script that uses `ssh` to connect to the provided server.

* **1. Create an SSH key pair**
  * [1-create_ssh_key_pair](./1-create_ssh_key_pair): Bash script that creates an RSA key pair.

* **2. Client configuration file**
  * [2-ssh_config](./2-ssh_config): SSH configuration file configured to use the private key
`~/.ssh/school` and to refuse authentication using a password.
