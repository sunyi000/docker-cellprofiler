#!/bin/sh -f

if [ ! -e $HOME/bin/cellprofiler_galaxy ]; then    
    cellprofiler
else    
    cellprofiler_galaxy
fi

