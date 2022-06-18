#!/bin/bash
set -e

# source info
source /etc/os-release

# variables
USER=$(whoami)
HOST=$(hostname -s)
DISTRO="${NAME} ${VERSION}"
KERNEL=$(uname -r)
SHELL_U=${SHELL##*/}

#set -x

# functions
Get_de() {
  # copy from neofetch
  if [[ "$XDG_CURRENT_DESKTOP" ]]; then
    de=${XDG_CURRENT_DESKTOP/X\-}
    de=${de/Budgie:GNOME/Budgie}
    de=${de/:Unity7:ubuntu}
  elif [[ "$DESKTOP_SESSION" ]]; then
    de=${DESKTOP_SESSION##*/}
  elif [[ "$GNOME_DESKTOP_SESSION_ID" ]]; then
    de=GNOME
  elif [[ "$MATE_DESKTOP_SESSION_ID" ]]; then
    de=MATE
  fi
  # Format strings.
  case $de in
    KDE_SESSION_VERSION*) de=KDE${de/* = } ;;
    *xfce4*)  de=Xfce4 ;;
    *xfce5*)  de=Xfce5 ;;
    *xfce*)   de=Xfce ;;
    *mate*)   de=MATE ;;
    *GNOME*)  de=GNOME ;;
    *MUFFIN*) de=Cinnamon ;;
  esac
}

#trap read debug

Get_wm() {
  # xprop attempt, copy from neofetch
  if command -v xprop &> /dev/null; then
    tmp_wm=$(xprop -root -notype _NET_SUPPORTING_WM_CHECK)
    if [ "${tmp_wm#* }" = " not found." ]; then
      wm=""
    else
      id=${tmp_wm##* }
      wm=$(xprop -id "$id" -notype -len 100 -f _NET_WM_NAME 8t)
      wm=${wm/*WM_NAME = }
      wm=${wm/\"}
      wm=${wm/\"*}
    fi
  fi

  # try with process
  if [[ -z "$wm" ]] && command -v lsof &> /dev/null; then
    # assume wm has "wm" in name
    tmp_var=$(lsof /home/"$USER" | grep --color=never wm)
    if [[ -n "$tmp_var" ]]; then
      wm="${tmp_var%% *}"
    else
      wm=""
    fi
  fi

  if [[ -z "$wm" ]]; then
    wm=""
  fi
}

Show_de_wm() {
  # if we are on tty:
  if [ -z "$DISPLAY" ]; then
    envir="TTY"
  else
    Get_de
    tmp_d="$de"
    Get_wm
    tmp_wm="$wm"
    if [[ -n "$tmp_d" && -z "$tmp_wm" ]]; then
      envir="$tmp_d"
    elif [[ -z "$tmp_d" && -n "$tmp_wm" ]]; then
      envir="$tmp_wm"
    elif  [[ -z "$tmp_d" && -n "$tmp_wm" && "$tmp_d" == "$tmp_wm" ]]; then
      envir="$tmp_d"
    elif  [[ -z "$tmp_d" && -n "$tmp_wm" && "$tmp_d" != "$tmp_wm" ]]; then
      envir="${tmp_d}/${tmp_wm}"
    else
      envir="NOT DETECTED"
    fi
  fi
}

Get_uptime() {
  IFS=. read -r UP _ < /proc/uptime;
  D=$((UP / 60 / 60 / 24))
  H=$((UP / 60 / 60 % 24))
  MIN=$((UP / 60 % 60))
  if [ "$D" -eq 0 ]; then
    UPTIME="${H}h ${MIN}min"
  else
    UPTIME="${D}D, ${H}h ${MIN}min"
  fi
}

Colourscheme() {
  for((i=40;i<48;i++)); do
    echo -en "\033[${i}m\033[30m   "
  done
  echo -e "\033[0m"

  for((i=100;i<108;i++)); do
    echo -en "\033[${i}m\033[30m   "
  done

  echo -e "\033[0m"
}

# Print stuffs
clear
echo -e "\033[1;37m${USER}\033[1;30m@\033[1;35m${HOST}\033[0m"
echo -e "\033[0;31m Distro:\033[0m ${DISTRO}"
echo -e "\033[0;32m Kernel:\033[0m ${KERNEL}"
Show_de_wm
echo -e "\033[0;33m DE/WM:\033[0m ${envir}"
echo -e "\033[0;34m Shell:\033[0m ${SHELL_U}"
Get_uptime
echo -e "\033[0;35m Uptime:\033[0m ${UPTIME}"
Colourscheme
