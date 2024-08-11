#!/bin/sh
# Enable some systemd services

systemctl --user enable kmonad@thinkpad.service
systemctl --user enable kmonad@thinkpad_external.service

systemctl --user enable emacs.service

systemctl --user enable eww.service
systemctl --user enable eww-open@clock
