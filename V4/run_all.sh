#!/usr/bin/env bash
set -e

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${CYAN}================================================================${NC}"
echo -e "${CYAN}   🚀 EJECUTANDO LOS 50 PATRONES DE DISEÑO EN AURA LANG (V4)   ${NC}"
echo -e "${CYAN}================================================================${NC}\n"

FILES=("$DIR"/*.aura)
TOTAL=${#FILES[@]}
PASSED=0

for file in "${FILES[@]}"; do
  bname=$(basename "$file")
  echo -e "${BLUE}▶ [${bname}]${NC}"
  aurac check "$file" > /dev/null
  aurac run "$file"
  echo -e "${GREEN}✓ OK - Finalizado exitosamente${NC}\n"
  PASSED=$((PASSED + 1))
done

echo -e "${GREEN}================================================================${NC}"
echo -e "${GREEN}   ✨ Todos los ${PASSED}/${TOTAL} patrones de diseño se ejecutaron con éxito! ${NC}"
echo -e "${GREEN}================================================================${NC}"
