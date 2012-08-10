#!/bin/sh
amixer sget 'PCM',0 | grep "Front Left: Playback" | \
    sed -e 's/%/ /' | sed -e 's/\[//' | awk {'print $5'}
