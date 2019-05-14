#! /bin/bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null && pwd)"

pushd "$DIR" > /dev/null
  if ! [ $(git rev-parse HEAD) = $(git ls-remote $(git rev-parse --abbrev-ref @{u} | sed 's/\// /g') | cut -f1) ]; then
    echo "Repository is not up to date! Updating now..."
    if ! git pull; then
      echo "Failed to update repository! Exiting!"
      exit 2
    fi
    echo "Restarting script..."
  fi  
  
  echo "Patching Slack..."

  # Insert the black theme directly into ssb-interop.js
  lineno=$(sed -n '/HERE/=' "$DIR/darkify_slack.js")
  file="/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js"
  head -n $((lineno - 1)) "$DIR/darkify_slack.js" >> $file
  cat black.css >> $file
  tail -n +$((lineno + 1)) "$DIR/darkify_slack.js" >> $file

  echo "Patched successfully!"
popd > /dev/null


