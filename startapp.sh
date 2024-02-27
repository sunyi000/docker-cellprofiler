#!/bin/sh -f

export PATH=${PATH}:$HOME/bin/

if [ ! -e $HOME/bin/cellprofiler_galaxy ]; then    
    cellprofiler
else    
    cellprofiler_galaxy
fi

