#!/usr/bin/env bash
set -e

# ==============================================================================
# Suite Runner: Patrones de Diseño v3 (Estilo Golang) en Aura Language (aurac)
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
RED='\033[0;31m'
NC='\033[0m' # No Color

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Verificar que aurac esté instalado o en PATH
if command -v aurac &> /dev/null; then
  AURAC="aurac"
elif [ -f "$HOME/.cargo/bin/aurac" ]; then
  AURAC="$HOME/.cargo/bin/aurac"
else
  echo -e "${RED}Error: 'aurac' no encontrado en PATH ni en ~/.cargo/bin/aurac${NC}"
  exit 1
fi

echo -e "${CYAN}================================================================${NC}"
echo -e "${CYAN}   🚀 EJECUTANDO SUITE v3: PATRONES DE DISEÑO EN AURA LANG     ${NC}"
echo -e "${CYAN}           (MODELO Y ESTILO DE DESARROLLO GOLANG)               ${NC}"
echo -e "${CYAN}================================================================${NC}\n"

PATTERNS=(
  "01_factory_method.aura:Creational - Factory Method (Duck Typing & Constructores New...)"
  "02_builder.aura:Creational - Builder (Estructuras Puras, Punteros & Fluent API)"
  "03_singleton.aura:Creational - Singleton Concurrente (sync.Once & Mutex con Defer)"
  "04_adapter.aura:Structural - Adapter (Composición de Structs & Duck Typing)"
  "05_decorator.aura:Structural - Decorator (Composición de Interfaces & Defer LIFO)"
  "06_facade.aura:Structural - Facade (Orquestación de Microservicios & Guard Clauses)"
  "07_composite.aura:Structural - Composite (Árboles Jerárquicos & Slices de Interfaces)"
  "08_proxy.aura:Structural - Proxy de Caché (Thread-Safe Proxy con Mutex & Defer)"
  "09_strategy.aura:Behavioral - Strategy (Polimorfismo Duck-Typed & First-Class Functions)"
  "10_observer.aura:Behavioral - Observer Pub-Sub (Concurrencia CSP & Canales Tipados)"
  "11_command.aura:Behavioral - Command (Comandos con Invocador & Pila LIFO de Undo)"
  "12_state.aura:Behavioral - State (Máquina de Estados Finita FSM con Contexto)"
  "13_chain_of_responsibility.aura:Behavioral - Chain of Responsibility (Middleware net/http)"
  "14_worker_pool.aura:Concurrency - Worker Pool (Goroutines, Canales & WaitGroup)"
  "15_object_pool.aura:Creational/Perf - Object Pool (Estilo sync.Pool & Defer)"
  "16_dependency_injection.aura:Architectural - Pure Dependency Injection (Acepta Interfaces, Retorna Structs)"
)

PASSED=0
TOTAL=${#PATTERNS[@]}

for item in "${PATTERNS[@]}"; do
  FILE="${item%%:*}"
  DESC="${item##*:}"
  FULL_PATH="$DIR/$FILE"

  echo -e "${BLUE}▶ [${FILE}]${NC} ${YELLOW}${DESC}${NC}"
  "$AURAC" check "$FULL_PATH" > /dev/null
  "$AURAC" run "$FULL_PATH"
  echo -e "${GREEN}✓ OK - ${FILE} finalizado exitosamente${NC}\n"
  PASSED=$((PASSED + 1))
done

echo -e "${GREEN}================================================================${NC}"
echo -e "${GREEN}   ✨ Todos los ${PASSED}/${TOTAL} patrones v3 (Estilo Golang) pasaron con éxito! ${NC}"
echo -e "${GREEN}================================================================${NC}"
