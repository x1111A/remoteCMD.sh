# remoteCMD.sh

Easy-to-use tool for system automation written in bash.

Program use SSH for connecting to remote host(s) so make sure that SSH server is enabled and started on your system(s) and your SSH key is copied as well.


Default directory is set to your `/home/` but you can change path variables inside the program for `.config/host.cfg` and `./config/config.cfg` to better serve your needs. Make sure to edit paths in `./config/config.cfg` file to change your_user_name part with your own to ensure proper parsing. If you have `sed` already installed you can make this with command `sed -i 's/your_user_name/your_actual_user_name/g' config.cfg` assuming your current directory is `./config`.

Replace entries in `./config/host.cfg` with your own host(s) list.
Commands stored inside `./config/commands` are written for CentOS/RHEL.Change that if necessary according to your remote host(s) OS.
Program by default creates its hidden log directory in user's `$HOME` so make sure to change that to better fit your needs.
Once the program is started, it will create log file according to the date it was run and will append to it all commands used on remote system(s) chronological by the time and user.

To make the program executable use for example `chmod 766 remoteCMD.sh` and to run it `./remoteCMD.sh -h` to view an available options first.
