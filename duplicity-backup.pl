#!/bin/perl -w
#
# duplicity-backup
# Marius Voila <myself@mariusv.com> 2011
#
# backups files using duplicity
#
###############################################################################
#
# Copyright (C) 2011 Marius Voila
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License, version 2, as
# published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
# or visit http://www.gnu.org/licenses/gpl.txt
#
###############################################################################

use strict;

###############################################################################
#
# configuration

# The directory to be backed up
my $srcdir = "";

# The directory on the remote server to store the backup (absolute path name)
my $backupdir = "";

# A list of space separated servers to send the backups
my @servers = "server1.domain.xyz server2.domain.xyz";

# The SSH private key (absolute path name)
my $key = "";

# Options to pass to SSH.  I recommend you set -oProtocol=2 for security
# purposes.  At bare minimum, -oIdentityFile=$key is required.
my $ssh_options = "-oProtocol=2 -oIdentityFile=$key";

# The name of the remote login
my $user = "";

# The key ID of the encryption key
my $encrypt_key = "";

# The key ID of the signing key
my $sign_key = "";

# The passphrase for the signing key
my $passphrase = "";

# A list of space separate files or directories you wish to be excluded from
# the backup
my @excludes;

###############################################################################
#
# Build $excludes_string

my ($exclude, $excludes_string);

foreach $exclude (@excludes)
{
        $excludes_string = "$excludes_string --exclude $exclude";
}

###############################################################################
#
# Main program
# Do not change anything past this point.

my $server;
my $cmd_string;

foreach $server (@servers)
{
    
    # Set the environmental variable PASSPHRASE
    $ENV{PASSPHRASE} = "$passphrase";

    # Set the cmd_string to run the backup
    # If $excludes_string is not defined, generate $cmd_string without the
    # --excludes option
    unless (defined($excludes_string))
    {
        $cmd_string = "duplicity --encrypt-key \"$encrypt_key\" --sign-key \"$sign_key\" --ssh-options=\"$ssh_options\" $srcdir scp://$user\@$server/$backupdir";
    } else
    {
        $cmd_string = "duplicity --encrypt-key \"$encrypt_key\" --sign-key \"$sign_key\" --ssh-options=\"$ssh_options\" $excludes_string $srcdir scp://$user\@$server/$backupdir";
    }

    # Run the command
    system($cmd_string);

    # Reset the environmental variable PASSPHRASE to null to minimize the time
    # it exists
    $ENV{PASSPHRASE} = "";
}
