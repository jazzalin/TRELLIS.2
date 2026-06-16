#!/bin/bash

srun --nodelist chacha \
     --cpus-per-task=2 \
     --time=48:00:00 \
     --mem-per-cpu 16GB \
     --gres=gpu:1 \
     --pty apptainer shell --writable-tmpfs --nv --nvccli --no-mount home \
                           --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/microsoft:/workspace/microsoft \
                           --bind $PHOTOCAST_OUTDIR/tmp:/tmp \
                           --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/facebook:/workspace/facebook \
                           --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/briaai:/workspace/briaai \
                           --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/cache:/home/loic.azzalini/.cache \
                           --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/output:/workspace/output /home/loic.azzalini/shared_photocast/isc_open_house/trellis/containers/trellis2.sif
