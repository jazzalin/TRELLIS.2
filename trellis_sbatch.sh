#!/bin/bash
#SBATCH --nodelist=chacha
#SBATCH --job-name=trellis
#SBATCH --nodes=1
#SBATCH --ntasks=4
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=16G
#SBATCH --time=48:00:00
#SBATCH --gres=gpu:1

apptainer exec --writable-tmpfs --nv --nvccli --no-mount home \
          --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/microsoft:/workspace/microsoft \
          --bind $PHOTOCAST_OUTDIR/tmp:/tmp \
          --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/facebook:/workspace/facebook \
          --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/weights/briaai:/workspace/briaai \
          --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/cache:/home/loic.azzalini/.cache \
          --bind /home/loic.azzalini/shared_photocast/isc_open_house/trellis/output:/workspace/output \
          /home/loic.azzalini/shared_photocast/isc_open_house/trellis/containers/trellis2.sif bash ./entrypoint.sh