# ucli - Universal Command Line Interface

## :rocket: Execute CLI applications without installing. 

One needs to install the whole CLI application/s (non-interactive) even when they are not used frequently or just to try it out. `ucli` aims to eliminate this. Let us say we want to **Track the Coronavirus disease** for some quick stats using Ahmad Awais's amazing [corona-cli](https://github.com/ahmadawais/corona-cli). Unfortunately for a new-user or on a new-machine, first **nodejs** needs to be installed. **nodejs** is one big package! Then we need to `npm install -g corona-cli`. Alternatively, `npx corona-cli` can be used (installs CLI on every run). We can do better!

Instead, **ucli** can come to the rescue. Run `ucli.sh` script file (Github PAT with *repo* scope required). Enter `corona` or `corona <your-country>` to get the stats on your terminal. Execution takes only a few seconds. **ucli** doesn't install **corona-cli** in your local machine. ucli runs **your command** on a virtual machine in cloud. You can now use your favorite CLI's :heart: without installing. No installation, no disk space usage! *(just a catch-phrase - please don't troll)*

## Usage
```bash
## In terminal,
# 1. Clone repo: 
git clone https://github.com/tsadarsh/ucli.git
# 2. Move to directory:
cd ./ucli
# Run ucli script file:
./ucli.sh
```

Note: ucli may respond with "**Timed Out**" when the VM is offline (most of the time!). Ping me when this happens.
