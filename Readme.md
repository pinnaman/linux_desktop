# About
python3 with x11vnc on alpine linux with selenium and webtools installed.

# Usage
docker run -d -p 5900:5900 pinnaman/alpine-desktop

After this use vnc-client to connect to your alpine.
Right click shows the menu

Every run as user alpine. This user has sudo rights.
The password=alpine you can change is with passwd in
the xterm.
