
#!/bin/bash

# Scrip de monitorizare resurse sistem - DevOps Portofolio
# Autor: hurdu-offline

LOG_FILE="system_report_$(date +'%Y%m%d_%H%M%S').log"

echo "=========================================="  | tee -a "$LOG_FILE"
echo "		RAPORT STARE SISTEM LINUX 	"  | tee -a "$LOG_FILE"
echo "Data: $(date)" | tee -a "$LOG_FILE"
echo "Hostname: $(hostname)" | tee -a "$LOG_FILE"
echo "=========================================="  | tee -a "$LOG_FILE"

echo -e "\n1. Utilizare Memorie RAM:" | tee -a "LOG_FILE"
free - h | tee -a "$LOG_FILE"

echo -e "\n2. Utilizare Spatiu Disc:" | tee -a "$LOG_FILE"
df -h /  | tee -a "$LOG_FILE"


#--- VERIFICARE AUTOMATA A SPATIULUI PE DISC (NIVELUL 2) ---
USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
THRESHOLD=80

echo -e "\n--- VERIFICARE ALERTA STOCARE ---" | tee -a "$LOG_FILE"
if [ "$USAGE" -gt "$THRESHOLD" ]; then
	echo "ALERTA CRITICA: Spatiul ocupat pe disc este de ${USAGE}% (peste limita de ${THRESHOLD}%)!" | tee -a "$LOG_FILE" 
else
	echo "OK: Spatiul ocupat pe disc este in limite normale (${USAGE}% utilizat)."  | tee -a "$LOG_FILE"
fi


echo -e "\n3. Incarcare Procesor (Uptime):" | tee -a "$LOG_FILE"
uptime   | tee -a "$LOG_FILE"

echo -e "\n====================================="  | tee -a "$LOG_FILE"
echo "Rarpot salvat cu succes in: $LOG_FILE" 
