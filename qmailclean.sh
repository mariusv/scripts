#!/bin/bash

#!/usr/bin/perl
##############################################################################
#
# Copyright (C) 2005-2012 Marius Voila <myself@mariusv.com>
#
# This program is Free Software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA.
#
###############################################################################

echo Cleaning Queue
mv /var/qmail/queue/lock /root/
cd /var/qmail/queue; find . -type f -exec rm -f '{}' \;
mv /root/lock /var/qmail/queue/
echo Queue is now Clean
