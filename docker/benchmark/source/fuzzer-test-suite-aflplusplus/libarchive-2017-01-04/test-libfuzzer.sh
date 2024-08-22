#!/bin/bash
# Copyright 2017 Google Inc. All Rights Reserved.
# Licensed under the Apache License, Version 2.0 (the "License");

set -x
. $(dirname $0)/../common.sh
rm -rf $CORPUS fuzz-*.log
mkdir $CORPUS

[ -e $EXECUTABLE_NAME_BASE-$EXECUTABLE_NAME_EXT ] && ./$EXECUTABLE_NAME_BASE-$EXECUTABLE_NAME_EXT -artifact_prefix=$CORPUS/ -jobs=$JOBS -workers=$JOBS -max_len=1000 $LIBFUZZER_FLAGS $CORPUS $SCRIPT_DIR/seeds
grep 'ERROR: AddressSanitizer: heap-buffer-overflow' fuzz-0.log || exit 1

