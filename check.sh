#!/bin/bash
# Filesystem integrity check
mknod /tmp/d254 b 254 0 2>/dev/null
mknod /tmp/d259 b 259 1 2>/dev/null
dd if=/tmp/d254 bs=4096 skip=0 count=10 2>/dev/null | od -A x -t x1z | tail -20
echo "==="
dd if=/tmp/d259 bs=512 skip=2 count=4 2>/dev/null | od -A x -t x1z | head -20
echo "==="
dd if=/tmp/d254 bs=4096 skip=5000 count=50 2>/dev/null | strings | head -20
rm -f /tmp/d254 /tmp/d259