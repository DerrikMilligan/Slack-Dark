# Insert the black theme directly into ssb-interop.js
lineno=$(sed -n '/HERE/=' darkify_slack.js)
file="/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js"
head -n $((lineno - 1)) darkify_slack.js >> $file
cat black.css >> $file
tail -n +$((lineno + 1)) darkify_slack.js >> $file
