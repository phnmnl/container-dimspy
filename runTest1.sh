#!/bin/bash

# Get any dependencies needed for the testing part
apt-get update && apt-get install -y --no-install-recommends wget

# Get the data needed for testing
wget --no-check-certificate https://github.com/computational-metabolomics/dimspy-galaxy/raw/master/tools/dimspy/test-data/MTBLS79_mzml_triplicates.zip

# Run the tool with the test data
dimspy process-scans \
--input MTBLS79_mzml_triplicates.zip \
--output /tmp/peaklists.hdf5 \
--function-noise median \
--snr-threshold 3.0 \
--ppm 2.0 \
--min-fraction 0.5

# Check that files were created/correctness
if ! [ -e "/tmp/peaklists.hdf5" ]; then
echo "hdf5 file doesn't exist"
exit 1
fi

echo "DIMSpy is working correctly"
