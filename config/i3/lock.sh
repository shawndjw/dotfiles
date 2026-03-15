#!/bin/sh

BLANK='#24273a'
CLEAR='#ffffff22'
# DEFAULT='#00897bE6'
DEFAULT='#24273a'
# TEXT='#00897bE6'
#TEXT='#cad3f5'
TEXT='#8aadf4'
# WRONG='#880000bb'
WRONG='#ed8796'
# VERIFYING='#00564dE6'
VERIFYING='#8bd5ca'

i3lock \
--insidever-color=$CLEAR     \
--ringver-color=$VERIFYING   \
\
--insidewrong-color=$CLEAR   \
--ringwrong-color=$WRONG     \
\
--inside-color=$BLANK        \
--ring-color=$DEFAULT        \
--line-color=$BLANK          \
--separator-color=$DEFAULT   \
\
--verif-color=$TEXT          \
--wrong-color=$TEXT          \
--time-color=$TEXT           \
--date-color=$TEXT           \
--layout-color=$TEXT         \
--keyhl-color=$WRONG         \
--bshl-color=$WRONG          \
\
--screen 1                   \
--blur 9                     \
--clock                      \
--indicator                  \
--time-str="%H:%M:%S"        \
--date-str="%A, %Y-%m-%d"       \
# --keylayout 1
