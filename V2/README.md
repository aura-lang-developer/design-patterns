# 🏛️ Patrones de Diseño v2 en Aura Language (`aurac`)

Suite de **Segunda Generación (v2)** de los 16 Patrones de Diseño de Software implementados en **Aura Language**. 

Esta versión reimagina cada patrón tradicional aprovechando **la totalidad de las capacidades modernas del lenguaje Aura**: tipos algebraicos (ADTs), concurrencia CSP (canales y fibras), variables dinámicas (`DynamicVar`), el sistema de condiciones y reinicios (Restarts estilo Common Lisp), transductores de cero-asignación, `defer`/`errdefer`, slices estilo Go, y empaquetado binario `packed struct`.

---

## 📊 Matriz de Características de Aura por Patrón

| # | Archivo | Patrón | Dominio de Negocio | Características de Aura Destacadas |
| :-: | :--- | :--- | :--- | :--- |
| **01** | [`01_factory_method.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/01_factory_method.aura) | **Factory Method** | Ingesta de Telemetría Multi-Cloud | ADTs exhaustivos, Átomos (`:datadog`, `:prometheus`), Slices `[]String`, Duck Typing, `defer` |
| **02** | [`02_builder.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/02_builder.aura) | **Builder** | Cliente de Clúster de Microservicios | `packed struct` para tramas de red, Átomos (`:grpc`, `:quic`), `errdefer` para rollback, Slices |
| **03** | [`03_singleton.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/03_singleton.aura) | **Singleton Concurrente** | Registro Global de Caché Multi-Tenant | `Once.new()`, `Mutex.new()`, `defer`, `DynamicVar` (Tenant scope), Fibras `spawn`, `WaitGroup` |
| **04** | [`04_adapter.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/04_adapter.aura) | **Adapter** | Disco de Bloques a Cloud Storage | `packed struct` (sectores binarios), Duck Typing (`CloudObjectStorage`), `errdefer`, Slicing |
| **05** | [`05_decorator.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/05_decorator.aura) | **Decorator** | Middleware de API Gateway | `DynamicVar` (Trace ID & RBAC), `defer` (LIFO timing), `errdefer` (alertas SOC), Átomos |
| **06** | [`06_facade.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/06_facade.aura) | **Facade** | Orquestador CI/CD Cloud-Native | Coordinación de 4 subsistemas, `errdefer` (rollback de K8s e Ingress), `defer`, Slices |
| **07** | [`07_composite.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/07_composite.aura) | **Composite** | DAG de Flujo de Trabajo y Tareas | ADT Recursivo (`WorkflowNode`), Transductores (`compose`, `into`), Pattern Matching |
| **08** | [`08_proxy.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/08_proxy.aura) | **Proxy de Resiliencia** | Circuit Breaker con Recuperación LISP | Sistema de Condiciones y Reinicios (`withRestarts`, `signalCondition`, `handleCondition`), Átomos |
| **09** | [`09_strategy.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/09_strategy.aura) | **Strategy** | Enrutamiento Bursátil de Órdenes | Polimórfico (Duck Typing) + Funcional con Pipeline (`\|>`), Transductores, Slices `[1:5]` |
| **10** | [`10_observer.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/10_observer.aura) | **Observer CSP** | Broker de Eventos Asíncrono Streaming | Concurrencia CSP (`Channel.make`, `spawn`), `DynamicVar`, ADTs de Dominio, `WaitGroup` |
| **11** | [`11_command.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/11_command.aura) | **Command** | Libro Mayor Contable Transaccional | ADTs, `errdefer` (invariante de saldo), Pila LIFO con Slices (`history[:total - 1]`), Undo |
| **12** | [`12_state.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/12_state.aura) | **State (FSM)** | Consenso Distribuido Raft | ADTs con datos por estado, Pattern Matching exhaustivo (prohíbe transiciones ilegales), `defer` |
| **13** | [`13_chain_of_responsibility.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/13_chain_of_responsibility.aura) | **Chain of Responsibility** | Pasarela de Seguridad Zero-Trust | `DynamicVar` (identidad de cliente), `defer`, `errdefer`, Slices de interceptores, Átomos |
| **14** | [`14_worker_pool.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/14_worker_pool.aura) | **Worker Pool** | Procesamiento Paralelo por Lotes | Fibras CSP, Canales con búfer, Slicing por lotes (`jobs[0:3]`, `jobs[3:]`), `WaitGroup` |
| **15** | [`15_object_pool.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/15_object_pool.aura) | **Object Pool** | Reciclaje de Buffers de Paquetes | Primitiva `Pool.new(...)`, `packed struct`, `defer pool.put(...)`, Concurrencia multi-fibra |
| **16** | [`16_dependency_injection.aura`](file:///Users/mavro/Projects/aura-lang/projects/design_patterns/v2/16_dependency_injection.aura) | **Dependency Injection** | Contenedor de Microservicios Cloud | Pure DI por constructor, Duck Typing, `DynamicVar` (Tenant context), `defer`/`errdefer`, Mocks |

---

## 🚀 Guía de Ejecución

### 1. Ejecutar la Suite Completa v2
El script automatizado compila con verificación de tipos (`aurac check`) y ejecuta (`aurac run`) cada patrón:

```bash
./projects/design_patterns/v2/run_all.sh
```

### 2. Ejecutar Patrones Individuales
```bash
# Patrón Observer con Concurrencia CSP y Canales
aurac run projects/design_patterns/v2/10_observer.aura

# Patrón Proxy con Sistema de Condiciones y Reinicios (Restarts)
aurac run projects/design_patterns/v2/08_proxy.aura

# Patrón State con Consenso Raft
aurac run projects/design_patterns/v2/12_state.aura

# Patrón Builder con Packed Structs y errdefer
aurac run projects/design_patterns/v2/02_builder.aura
```

### 3. Verificación Estática de Tipos Hindley-Milner
```bash
aurac check projects/design_patterns/v2/16_dependency_injection.aura
```

---

## 🌟 Lo Nuevo en la Suite v2 vs v1

1. **Variables Dinámicas (`DynamicVar`)**:
   Eliminan la necesidad de taladrar parámetros contextuales (Trace ID, Tenant, Rol de seguridad) a través de todas las capas de llamadas intermedias.
2. **Sistema de Condiciones y Reinicios (`withRestarts`, `signalCondition`, `handleCondition`)**:
   En lugar de desenrollar y destruir la pila con excepciones clásicas, los sitios de falla declaran estrategias de recuperación que el código superior puede invocar de forma transparente (visto en `08_proxy.aura`).
3. **Sentencias `errdefer` (Inspiradas en Zig)**:
   Garantizan transaccionalidad y limpieza condicional que **solo** se ejecuta si la función falla o aborta (ejemplificado en `02_builder`, `04_adapter`, `06_facade`, `11_command`, `13_chain_of_responsibility` y `16_dependency_injection`).
4. **Packed Structs (`export packed struct`)**:
   Definición exacta a nivel de byte para tramas de red y sectores binarios de disco, unificando programación de sistemas de bajo nivel con alto nivel.
5. **Transductores Funcionales (`compose`, `filtering`, `mapping`, `taking`, `into`)**:
   Procesamiento algorítmico de colecciones en una sola pasada con cero asignaciones de arrays intermedios en memoria.
6. **Slices estilo Golang (`[]T`, `s[low:high]`, `len`, `append`)**:
   Colecciones secuenciales homogéneas con sintaxis concisa de rebanado.
