#!/usr/bin/python3
"""Script creates an archive with different name based on date"""

from fabric.api import *
from datetime import datetime
import os


env.hosts = ['35.231.107.90', '34.148.57.17']


def do_deploy(archive_path):
    ar_l = archive_path.split(".tgz")
    art = "".join(ar_l)
    ar2_l = art.split("versions/")
    ar = "".join(ar2_l)
    ar_l = archive_path.split("versions/")
    ar = "".join(ar3_l)

    if archive_path:
        put(archive_path, '/tmp/')

        run("mkdir -p /data/web_static/releases/{}/".format(ar))
        run("tar -xzf /tmp/{}.tgz -C /data/web_static/releases/{}/".format(ar, ar))
        run("rm /tmp/{}.tgz".format(ar))

        run("mv /data/web_static/releases/{}/web_static/*\
        /data/web_static/releases/{}/".format(ar, ar))
        run("rm -rf /data/web_static/releases/{}/web_static".format(ar))
        run("rm -rf /data/web_static/current")

        run("ln -s /data/web_static/releases/{}/ /data/web_static/current".format(ar))
        print("New version deployed!")

        return True
    else:
        return False
