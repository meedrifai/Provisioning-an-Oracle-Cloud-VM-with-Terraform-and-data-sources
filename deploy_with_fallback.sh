#!/bin/bash

SHAPES=(
  "VM.Standard.E2.1.Micro"
  "VM.Standard.A1.Flex:1:6"
  "VM.Standard.E4.Flex:1:8"
  "VM.Standard.E3.Flex:1:8"
)

for shape_config in "${SHAPES[@]}"; do
  IFS=':' read -r shape ocpus memory <<< "$shape_config"
  
  echo "🔄 Tentative avec $shape..."
  
  # Met à jour terraform.tfvars
  sed -i "s/vm_shape = .*/vm_shape = \"$shape\"/" terraform.tfvars
  
  if [[ $shape == *"Flex"* ]]; then
    sed -i "s/vm_ocpus = .*/vm_ocpus = $ocpus/" terraform.tfvars
    sed -i "s/vm_memory_in_gbs = .*/vm_memory_in_gbs = $memory/" terraform.tfvars
  fi
  
  terraform apply -auto-approve
  
  if [ $? -eq 0 ]; then
    echo "✅ Succès avec $shape !"
    exit 0
  fi
  
  echo "❌ Échec avec $shape, on essaie le suivant..."
done

echo "❌ Aucun shape disponible"
exit 1
