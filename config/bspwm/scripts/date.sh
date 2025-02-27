#!/bin/bash 

# Colores 
# Colores  
ice="%{F#b0e0e6}"         # Azul claro, similar al color hielo
sky="%{F#87ceeb}"         # Azul cielo
royal="%{F#4169e1}"       # Azul real
purple="%{F#800080}"      # Morado
reset="%{F#ffffff}"       # Reset (Blanco)
powderbl="%{F#b0e0e6}"    # Azul pastel, similar al color hielo
sun="%{F#ffd700}"         # Amarillo sol brillante
sunsetor="%{F#ff4500}"    # Naranja intenso (atardecer)
sunsetred="%{F#ff6347}"   # Rojo atardecer cálido
dawn="%{F#ff8c00}"        # Naranja suave (amanecer)
moon="%{F#fafad2}"        # Amarillo pálido (luz de luna)

# Hora actual 
date="$(date | awk '{print $5}')" 
# Hora INT 
hour="$(date +%H)"

# Mostrar el saludo según la hora
if [ $hour -ge 00 ] && [ $hour -lt 06 ]; then
  echo -e "${moon} ${reset}${purple}$date${reset}"
elif [ $hour -ge 06 ] && [ $hour -lt 12 ]; then
  echo -e "${dawn}  ${reset}${ice}$date${reset}"
elif [ $hour -ge 12 ] && [ $hour -lt 17 ]; then
  echo -e "${sun}  ${reset}${sky}$date${reset}"
elif [ $hour -ge 17 ] && [ $hour -lt 22 ]; then
  echo -e "${sunsetred}  ${reset}${sky}$date${reset}"
else
  echo -e "${moon} ${reset}${royal}$date${reset}"
fi

