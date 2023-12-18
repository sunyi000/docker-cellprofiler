#!/bin/sh -f

# Calls the symlink under /bin
if [ ! -e /bin/cellprofiler_galaxy ]; then    
    cellprofiler
else    
    cellprofiler_galaxy
fi

