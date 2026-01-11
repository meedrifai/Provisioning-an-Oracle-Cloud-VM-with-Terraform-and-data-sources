#!/bin/bash
MAX_ATTEMPTS=100
ATTEMPT=1
SLEEP_TIME=60  # ✅ 1 minute au lieu de 5

echo "🚀 Retry automatique Terraform OCI"
echo "Tentatives max: $MAX_ATTEMPTS"
echo "Intervalle: 1 minute"
echo ""

while [ $ATTEMPT -le $MAX_ATTEMPTS ]; do
  echo "📍 [$(date '+%H:%M:%S')] Tentative $ATTEMPT/$MAX_ATTEMPTS"
  
  terraform apply -auto-approve
  
  if [ $? -eq 0 ]; then
    echo ""
    echo "✅ SUCCÈS après $ATTEMPT tentative(s)!"
    terraform output
    exit 0
  fi
  
  echo "⚠️  Échec - Retry dans 1 min..."
  echo ""
  sleep $SLEEP_TIME
  ATTEMPT=$((ATTEMPT + 1))
done

echo "❌ Échec après $MAX_ATTEMPTS tentatives"
exit 1
