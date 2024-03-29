#!/usr/bin/env bash
# -------------------------------------------------
#  Get monitors configuration from monitor.xml and apply it for current user session.
#  In case of multiple definitions in monitor.xml only first one is used.
#
#  See http://bernaerts.dyndns.org/linux/74-ubuntu/309-ubuntu-dual-display-monitor-position-lost
#  for instructions
#
#  Parameters :
#    $1 : waiting time in sec. before forcing configuration (optional)
#
#  Revision history :
#    19/04/2014, V1.0 - Creation by N. Bernaerts
#    10/07/2014, V1.1 - Wait 5 seconds for X to fully initialize
#    01/09/2014, V1.2 - Correct NULL file bug (thanks to Ivan Harmady) and handle rotation
#    07/10/2014, V1.3 - Add monitors size and rate handling (idea from jescalante)
#    08/10/2014, V1.4 - Handle primary display parameter
#    08/12/2014, V1.5 - Waiting time in seconds becomes a parameter
#    06/05/2020, V1.6 - Handle scale parameter
#    07-04-2023  V1.7 - kbravh - clean up script
# -------------------------------------------------
set -o pipefail
set -x

if ! command -v xmllint &>/dev/null; then
  echo "Error: xmllint command is not available. Please install libxml2-utils and try again."
  exit 1
fi

esc() { printf "%s\n" "$1" | sed -e "s/'/'\"'\"'/g" -e "1s/^/'/" -e "\$s/\$/'/"; }

# monitor.xml path
MONITOR_XML="$HOME/monitors.xml"

if [ -z "$MONITOR_XML" ] || [ ! -f "$MONITOR_XML" ]; then
  echo "The monitor configuration file was not found at ${MONITOR_XML}. Please verify the location of the file and try again."
  exit 1
fi

# get number of declared monitors
NUM=$(xmllint --xpath 'count(//monitors/configuration[1]/logicalmonitor)' "${MONITOR_XML}")

# loop thru declared monitors to create the command line parameters
for ((i = 1; i <= NUM; i++)); do
  # get attributes of current monitor (name and x & y positions)
  NAME=$(xmllint --xpath 'string(//monitors/configuration[1]/logicalmonitor['$i']/monitor/monitorspec/connector/text())' "${MONITOR_XML}" 2>/dev/null)
  POS_X=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/x/text()' "${MONITOR_XML}" 2>/dev/null)
  POS_Y=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/y/text()' "${MONITOR_XML}" 2>/dev/null)
  SCALE=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/scale/rate/text()' "${MONITOR_XML}" 2>/dev/null)
  ROTATE=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/rotation/text()' "$MONITOR_XML" 2>/dev/null)
  WIDTH=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/monitor/mode/width/text()' "${MONITOR_XML}" 2>/dev/null)
  HEIGHT=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/monitor/mode/height/text()' "${MONITOR_XML}" 2>/dev/null)
  RATE=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/monitor/mode/rate/text()' "${MONITOR_XML}" 2>/dev/null)
  PRIMARY=$(xmllint --xpath '//monitors/configuration[1]/logicalmonitor['$i']/primary/text()' "${MONITOR_XML}" 2>/dev/null)

  MODELINE=$(cvt "${WIDTH}" "${HEIGHT}" | grep -e "Modeline [^(]" | sed -r 's/.*Modeline (.*)/\1/')
  MODERES=$(echo "${MODELINE}" | grep -o -P '(?<=").*(?=")')
  MODELINE=($(echo "${MODELINE}" | sed -r 's/.*"(.*)"/\1/'))

  # if position is defined for current monitor, add its position and orientation to command line parameters
  [ -n "${POS_X}" ] && PARAM_ARR=("${PARAM_ARR[@]}" "--output" "${NAME}" "--pos" "${POS_X}x${POS_Y}" "--mode" "${MODERES}" "--rate" "${RATE}")
  [ -n "${SCALE}" ] && PARAM_ARR=("${PARAM_ARR[@]}" "--scale" "${SCALE}")
  [ -n "${ROTATE}" ] && PARAM_ARR=("${PARAM_ARR[@]}" "--rotate" "${ROTATE}")

  # addmodes before so they can set
  xrandr --newmode ${MODELINE[*]}
  xrandr --addmode "${NAME}" "${MODERES}"

  # if monitor is defined as primary, adds it to command line parameters
  [ "${PRIMARY}" = "yes" ] && PARAM_ARR=("${PARAM_ARR[@]}" "--primary")
done

# if needed, wait for some seconds (for X to finish initialisation)
[ -n "$1" ] && sleep "$1"

# position all monitors
xrandr "${PARAM_ARR[@]}"
