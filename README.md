# remoteCMD.sh

Easy-to-use tool for system automation written in bash.

Program use SSH for connecting to remote host(s) so make sure that SSH server is enabled and started on your system(s) and your SSH key is copied as well.


Default directory is set to your `/home/` but you can change path variables inside the program for `.config/host.cfg` and `./config/config.cfg` to better serve your needs. Make sure to edit paths in `./config/config.cfg` file to change your_user_name part with your own to ensure proper parsing. If you have `sed` already installed you can make this with command `sed -i 's/your_user_name/your_actual_user_name/g' config.cfg` assuming your current directory is `./config`.

Commands stored inside `./config/commands` are written for CentOS/RHEL.Change that if necessary according to your remote host(s) OS.

To make the program executable use for an example `chmod 766 remoteCMD.sh` and to run it `./remoteCMD.sh -h` to view an available options first.
