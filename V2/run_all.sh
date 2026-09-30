#!/usr/bin/env bash
set -e

# ==============================================================================
# Suite Runner: Patrones de Diseño v2 en Aura Language (aurac)
# Demostrando cada una de las capacidades avanzadas del lenguaje Aura
# ==============================================================================

GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo -e "${CYAN}================================================================${NC}"
echo -e "${CYAN}   🚀 EJECUTANDO LA SUITE v2 DE PATRONES DE DISEÑO EN AURA      ${NC}"
echo -e "${CYAN}   Aprovechando la totalidad de las características del lenguaje ${NC}"
echo -e "${CYAN}================================================================${NC}\n"

PATTERNS=(
  "01_factory_method.aura:Creational - Factory Method v2 (ADTs, Atoms, Slices, Duck Typing & defer)"
  "02_builder.aura:Creational - Builder v2 (Packed Structs, errdefer, Slices & Fluent API)"
  "03_singleton.aura:Creational - Singleton v2 (Once, Mutex, defer, DynamicVar, Fibers & WaitGroup)"
  "04_adapter.aura:Structural - Adapter v2 (Packed Structs, Duck Typing, errdefer & Slices)"
  "05_decorator.aura:Structural - Decorator v2 (DynamicVar, defer, errdefer & RBAC Atoms)"
  "06_facade.aura:Structural - Facade v2 (Subsystems Orchestration, errdefer, defer & Slices)"
  "07_composite.aura:Structural - Composite v2 (Recursive ADTs, Transducers & Tree Path)"
  "08_proxy.aura:Structural - Proxy v2 (LISP Condition & Restart System, DynamicVar & Atoms)"
  "09_strategy.aura:Behavioral - Strategy v2 (Pipeline |>, Transducers, Slices & Duck Typing)"
  "10_observer.aura:Behavioral - Observer v2 (CSP Channels, Fibers, DynamicVar & WaitGroup)"
  "11_command.aura:Behavioral - Command v2 (ADTs, errdefer, Slices LIFO History & Undo)"
  "12_state.aura:Behavioral - State v2 (Raft FSM, ADTs, Exhaustive Matching & defer)"
  "13_chain_of_responsibility.aura:Behavioral - Chain of Responsibility v2 (Zero-Trust, DynamicVar, defer & errdefer)"
  "14_worker_pool.aura:Concurrency - Worker Pool v2 (CSP Fibers, Buffered Channels, Slices & WaitGroup)"
  "15_object_pool.aura:Creational/Perf - Object Pool v2 (Pool.new, Packed Structs, defer & Multi-Fiber)"
  "16_dependency_injection.aura:Architectural - Dependency Injection v2 (Pure DI, DynamicVar, Slices & Mocks)"
)

PASSED=0
TOTAL=${#PATTERNS[@]}

for item in "${PATTERNS[@]}"; do
  FILE="${item%%:*}"
  DESC="${item##*:}"
  FULL_PATH="$DIR/$FILE"

  echo -e "${BLUE}▶ [${FILE}]${NC} ${YELLOW}${DESC}${NC}"
  aurac check "$FULL_PATH" > /dev/null
  aurac run "$FULL_PATH"
  echo -e "${GREEN}✓ OK - Finalizado exitosamente${NC}\n"
  PASSED=$((PASSED + 1))
done

echo -e "${GREEN}================================================================${NC}"
echo -e "${GREEN}   ✨ Todos los ${PASSED}/${TOTAL} patrones v2 se ejecutaron con éxito! ${NC}"
echo -e "${GREEN}================================================================${NC}"
