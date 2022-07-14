#!/usr/bin/python3
"""Script creates an archive with different name based on date"""

from datetime import datetime
from fabric.api import local
import os

def do_pack():
    """ function do_pack """

    try:
    time = datetime.utcnow().strftime('%Y%m%d%H%M%S')
    path = "versions/web_static_{}.tgz".format(time)
    cmd = "tar -cvzf {} web_static".format(path)
    local("mkdir -p  versions")
    local(cmd)
    except:
        return None
    return path
