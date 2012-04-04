Description
===========

You'll find here all the open-source code I produce. This is just a collection of tiny utility scripts, patches, hacks and forks I want to or have to redistribute with the open source community at large.

If for any reason one of these hacks get momentum, I'll move them to a stand-alone and dedicated project.


Script list
===========



postfix-delete.pl
-----------------
This script delete all queued messages from postfix

Usage:

For example, delete all queued messages from or to the domain called mariusv.com, enter:

./postfix-delete.pl mariusv.com

Delete all queued messages that contain the word "xyz" in the e-mail address:

./postfix-delete.pl xyz


duplicity-backup.pl
-------------------
Backing up your server(or just one folder) with duplicity. Warning, this is for server to server via SSH!!
