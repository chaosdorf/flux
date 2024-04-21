#!/bin/bash

# start pulseaudio in background
pulseaudio --system &
sleep 10

# source
pactl load-module module-tunnel-source source=$PA_SOURCE_NAME server=$PA_SOURCE_SERVER format=$PA_SOURCE_FORMAT channels=$PA_SOURCE_CHANNELS rate=$PA_SOURCE_RATE

# sink
pactl load-module module-tunnel-sink sink=$PA_SINK_NAME server=$PA_SINK_SERVER format=$PA_SINK_FORMAT channels=$PA_SINK_CHANNELS rate=$PA_SINK_RATE

# start mumble cli daemon
mumd &
sleep 5

# connect to mumble server
mumctl connect --accept-invalid-cert $MUMBLE_SERVER $MUMBLE_USERNAME

# switch to channel
mumctl channel connect $MUMBLE_CHANNEL

# and wait
tail -f /dev/null