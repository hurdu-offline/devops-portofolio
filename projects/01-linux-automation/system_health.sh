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

echo -e "\n3. Incarcare Procesor (Uptime):" | tee -a "$LOG_FILE"
uptime   | tee -a "$LOG_FILE"

echo -e "\n====================================="  | tee -a "$LOG_FILE"
echo "Rarpot salvat cu succes in: $LOG_FILE" 
