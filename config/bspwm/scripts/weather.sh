#!/bin/bash 

# Coordenadas (Luxemburgo como ejemplo) 
LAT="49.6117" 
LON="6.1319" 

# Obtener datos del clima 
API_URL="https://api.open-meteo.com/v1/forecast?latitude=$LAT&longitude=$LON&current_weather=true" 
RESPONSE=$(curl -s "$API_URL") 

# Extraer temperatura y código de clima 
TEMP=$(echo "$RESPONSE" | jq -r '.current_weather.temperature') 
WEATHER_CODE=$(echo "$RESPONSE" | jq -r '.current_weather.weathercode') 

# Mapeo de códigos de Open-Meteo a estados del clima con iconos Nerd Fonts
declare -A WEATHER_MAP=( 
    [0]=" "
    [1]=" "
    [2]=" "
    [3]=" "
    [45]=" "
    [48]=" "
    [51]=" "
    [53]=" "
    [55]=" "
    [61]=" "
    [63]=" "
    [65]=" "
    [66]=" "
    [67]=" "
    [71]=" "
    [73]=" "
    [75]=" "
    [77]=" "
    [80]=" "
    [81]=" "
    [82]=" "
    [85]=" "
    [86]=" "
    [95]=" "
    [96]=" "
    [99]=" "
) 

# Mapeo de colores para Polybar (HEX)
declare -A COLOR_MAP=(
    [0]="%{F#FFD700}"   # Sol - Amarillo
    [1]="%{F#FFD700}"   # Principalmente despejado - Amarillo
    [2]="%{F#A0A0A0}"   # Parcialmente nublado - Gris
    [3]="%{F#808080}"   # Nublado - Gris oscuro
    [45]="%{F#B0B0B0}"  # Niebla - Gris claro
    [48]="%{F#B0B0B0}"  # Niebla con escarcha - Gris claro
    [51]="%{F#4682B4}"  # Llovizna ligera - Azul acero
    [53]="%{F#4682B4}"  # Llovizna moderada - Azul acero
    [55]="%{F#4169E1}"  # Llovizna densa - Azul real
    [61]="%{F#4169E1}"  # Lluvia ligera - Azul real
    [63]="%{F#0000FF}"  # Lluvia moderada - Azul
    [65]="%{F#00008B}"  # Lluvia intensa - Azul oscuro
    [66]="%{F#5F9EA0}"  # Lluvia helada ligera - Azul verdoso
    [67]="%{F#4682B4}"  # Lluvia helada fuerte - Azul acero
    [71]="%{F#ADD8E6}"  # Nieve ligera - Azul claro
    [73]="%{F#B0E0E6}"  # Nieve moderada - Azul celeste
    [75]="%{F#E0FFFF}"  # Nieve intensa - Azul pálido
    [77]="%{F#87CEFA}"  # Granos de nieve - Azul cielo
    [80]="%{F#4169E1}"  # Chubascos ligeros - Azul real
    [81]="%{F#0000FF}"  # Chubascos moderados - Azul
    [82]="%{F#00008B}"  # Chubascos fuertes - Azul oscuro
    [85]="%{F#B0E0E6}"  # Chubascos de nieve ligeros - Azul celeste
    [86]="%{F#E0FFFF}"  # Chubascos de nieve intensos - Azul pálido
    [95]="%{F#0864c7}"  # Tormenta - Naranja oscuro
    [96]="%{F#0864c7}"  # Tormenta con granizo - Carmesí
    [99]="%{F#0864c7}"  # Tormenta fuerte con granizo - Rojo oscuro
)

# Obtener la descripción del clima y su color
WEATHER_DESC=${WEATHER_MAP[$WEATHER_CODE]:-" Desconocido"}  # nf-fa-question_circle ()
COLOR=${COLOR_MAP[$WEATHER_CODE]:-"%{F#FFFFFF}"}  # Color blanco por defecto

# Mostrar resultado con iconos y color en Polybar
echo -e "${COLOR}${WEATHER_DESC}- (${TEMP}°C)%{F-}"

