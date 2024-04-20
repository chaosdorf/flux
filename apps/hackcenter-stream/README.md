# Hackcenter Stream

nginx deployment hosting a simple static HTML page that pulls in the stream of the RackPi in the Hackcenter. Can be used to mirror the output of the Hackcenter projector to other devices, e.g. Chromecasts.

NOTE: The stream is not transcoded and therefore in MJPG format. Older devices (e.g. Chromecast 1st Gen) cannot decode MJPG streams in real time and will have a low framerate.