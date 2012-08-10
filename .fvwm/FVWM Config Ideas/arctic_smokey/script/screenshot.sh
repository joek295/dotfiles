#!/bin/bash
sleep 5
import -window root ~/Capture.jpg
convert ~/Capture.jpg -resize 400x300 ~/Capture_min.jpg
