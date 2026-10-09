# 🏛️ Patrones de Diseño v3 en Aura Language (`aurac`) — Estilo Golang

Suite completa de **Tercera Generación (v3)** de los 16 Patrones de Diseño de Software implementados en **Aura Language**, adoptando de forma estricta e idiomática el **estilo y modelo de desarrollo de Golang**.

---

## 🌟 Filosofía de Diseño: El Modelo Golang en Aura Lang

A diferencia de las versiones previas centradas en clausuras funcionales (v1) o características experimentales (v2), la **v3** reimagina toda la arquitectura de patrones bajo las directrices y convenciones consagradas en el ecosistema **Go**:

| Concepto en Go | Implementación Idiomática en Aura Lang (v3) | Beneficio Clave |
| :--- | :--- | :--- |
| **"Acepta interfaces, retorna structs"** | Funciones y constructores reciben `Interface` y devuelven structs concretos | Máxima modularidad, testeabilidad con Mocks y mínimo acoplamiento. |
| **Métodos con Receptor (*Receiver Methods*)** | Declaración externa `fn (s: Struct) Method()` y `fn (s: *Struct) Method()` | Separación limpia entre datos y comportamiento, sin jerarquías de clases. |
| **Duck Typing Estructural** | Interfaces implícitas sin palabras clave `implements` | Cualquier struct que declare la firma requerida satisface la interfaz automáticamente. |
| **Reglas de Visibilidad por Capitalización** | Nombres en **PascalCase** (públicos/exportados) y **camelCase** (internos) | Convención consistente de exportación y claridad de API pública. |
| **Constructores Canónicos `New...()`** | Funciones de inicialización explícita (`NewServerConfig()`, `NewEventBus()`) | Inicialización determinista con valores por defecto seguros y validación. |
| **Manejo de Errores con Guard Clauses** | Retornos tempranos con `Result<T, String>` (`Ok(val)` / `Err(err)`) | Eliminación de anidamientos profundos (*early return / happy path*). |
| **Garantía de Recursos con `defer` LIFO** | `defer s.mu.unlock()`, `defer file.close()`, `defer wg.done()` | Desbloqueo y liberación simétrica de recursos imposible de omitir. |
| **Concurrencia CSP Nativa** | Canales tipados (`Channel<T>`), tareas concurrentes (`spawn`/`go`) y `WaitGroup` | Comunicación segura entre procesos secuenciales sin estado mutable compartido. |
| **Slices y Segmentación de Memoria** | Sintaxis nativa `[]T`, `len`, `cap`, `append` y rebanado `s[low:high]` | Manipulación eficiente y homogénea de secuencias contiguas de datos. |

---

## 📊 Matriz Comparativa: V1 vs V2 vs V3

| Patrón | Enfoque v1 (Funcional / Records) | Enfoque v2 (Avanzado / Restarts) | Enfoque v3 (Idiomático Golang) |
| :--- | :--- | :--- | :--- |
| **01. Factory Method** | ADTs exhaustivos y registros con closures | Átomos (`:datadog`) y ADTs con telemetry | Structs concretos, constructores `New...` e interfaz `NotificationSender` |
| **02. Builder** | Spread de registros inmutables `{...base}` | `packed struct` y `errdefer` | Struct mutable con receptor de puntero `*ServerConfigBuilder` y Fluent API |
| **03. Singleton** | Primitiva `Once.new()` sobre record plano | Mutex con DynamicVar multi-tenant | `sync.Once` canónico con `DatabasePool`, métodos con receptor y `defer mu.unlock()` |
| **04. Adapter** | Conversión funcional con closures | Sectores binarios empaquetados | Composición de structs: `LegacyPaymentAdapter` envolviendo `LegacyXmlGateway` |
| **05. Decorator** | Funciones de orden superior sobre records | RBAC con DynamicVar | Composición de interfaces envolventes con `defer` LIFO para tracing simétrico |
| **06. Facade** | Funciones libres orquestadas secuencialmente | Rollback condicional con `errdefer` | Struct `OrderProcessingFacade` con composición de subsistemas y guard clauses |
| **07. Composite** | Tipo suma recursivo (`File \| Directory`) | DAG con transductores de cero asignación | Interfaz `FileSystemEntry`, structs `FileItem` y `DirectoryItem` con slices `[]FileSystemEntry` |
| **08. Proxy** | Closure con intercepción en `Map` | Circuit breaker con reinicios Common Lisp | `CachedWeatherProxy` thread-safe con `Mutex`, `defer` y verificación concurrente |
| **09. Strategy** | Pipeline funcional (`\|>`) y registros | Enrutamiento bursátil con slices | Interfaz `TaxStrategy` polimórfica (IVA/US/Exento) + Estrategia funcional first-class |
| **10. Observer** | Canales planos en fibers asíncronos | Bus streaming con DynamicVar | `EventBus` con `[]Channel<Event>`, `Mutex` de suscripción, tareas en background y `WaitGroup` |
| **11. Command** | Variantes ADT con historial inmutable | Libro contable con rollbacks | Interfaz `Command` (`Execute`/`Undo`), struct `TextDocument` e invocador `CommandManager` |
| **12. State** | ADT con datos por variante (FSM funcional) | Consenso distribuido Raft | Interfaz `OrderState`, struct `OrderContext` y transiciones polimórficas |
| **13. Chain of Resp.** | Middlewares como funciones interceptoras | Pasarela zero-trust con DynamicVar | Pipeline de handlers estilo `net/http` (`Auth` -> `RateLimit` -> `Validator` -> `Endpoint`) |
| **14. Worker Pool** | Bucle recursivo con optimización TCO | Lotes de slicing con Canales | `WorkerPool` CSP: Múltiples workers concurrentes consumiendo canales y sincronizados con `WaitGroup` |
| **15. Object Pool** | Primitiva de runtime `Pool.new()` | Reciclaje de buffers en paquetes | Implementación pura estilo `sync.Pool` (`Get`, `Put`, `Reset`) con `defer pool.Put(buf)` |
| **16. Dependency Inj.** | Pure DI sobre registros inmutables | Contenedor de microservicios | Pure DI Go: "Acepta interfaces, retorna structs" con Mocks para testing |

---

## 📋 Catálogo Completo de Patrones v3

| # | Archivo | Patrón | Categoría | Conceptos de Go Destacados en Aura |
| :-: | :--- | :--- | :--- | :--- |
| **01** | [`01_factory_method.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/01_factory_method.aura) | **Factory Method** | Creacional | Interfaz `NotificationSender`, structs (`EmailSender`, `SmsSender`, `SlackSender`, `WebhookSender`), constructores `New...` y fábrica dinámica. |
| **02** | [`02_builder.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/02_builder.aura) | **Builder** | Creacional | Receptor de puntero (`*ServerConfigBuilder`), API fluida encadenable, validación con `Result<T, String>` y slices `[]String`. |
| **03** | [`03_singleton.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/03_singleton.aura) | **Singleton Concurrente** | Creacional | Inicialización atómica segura con `sync.Once` (`Once.new()`), `Mutex` con `defer` y verificación con 6 goroutines concurrentes. |
| **04** | [`04_adapter.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/04_adapter.aura) | **Adapter** | Estructural | Composición estructural: adaptación de un servicio legado XML a la interfaz `PaymentProcessor` mediante struct envolvente. |
| **05** | [`05_decorator.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/05_decorator.aura) | **Decorator** | Estructural | Composición de interfaz `DataStore` con decoradores `LoggingStoreDecorator` y `MetricsStoreDecorator`, utilizando `defer` LIFO para auditoría. |
| **06** | [`06_facade.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/06_facade.aura) | **Facade** | Estructural | Fachada `OrderProcessingFacade` orquestando 4 subsistemas independientes con composición, guard clauses y retornos tempranos. |
| **07** | [`07_composite.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/07_composite.aura) | **Composite** | Estructural | Interfaz común `FileSystemEntry`, nodo hoja `FileItem` y compuesto `DirectoryItem` con slices dinámicos de interfaces y método `Add`. |
| **08** | [`08_proxy.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/08_proxy.aura) | **Proxy de Caché** | Estructural | `CachedWeatherProxy` thread-safe que intercepta llamadas satelitales lentas mediante `Map`, sincronizado con `Mutex` y `defer`. |
| **09** | [`09_strategy.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/09_strategy.aura) | **Strategy** | Comportamiento | Dos estilos de Go: Estrategia polimórfica basada en la interfaz `TaxStrategy` e intercambiable en caliente (`SetTaxStrategy`), más estrategia funcional con funciones de primera clase. |
| **10** | [`10_observer.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/10_observer.aura) | **Observer (Pub-Sub CSP)** | Comportamiento | Bus de eventos concurrente con canales tipados `Channel<Event>`, observadores en tareas independientes (`spawn`) y `WaitGroup`. |
| **11** | [`11_command.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/11_command.aura) | **Command con Undo Stack** | Comportamiento | Interfaz `Command` (`Execute`, `Undo`), receptor mutable `TextDocument`, e invocador `CommandManager` con pila LIFO sobre slices. |
| **12** | [`12_state.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/12_state.aura) | **State (FSM)** | Comportamiento | Máquina de estados desacoplada: interfaz `OrderState`, struct `OrderContext` y estados (`Created`, `Paid`, `Shipped`, `Delivered`, `Cancelled`). |
| **13** | [`13_chain_of_responsibility.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/13_chain_of_responsibility.aura) | **Chain of Responsibility** | Comportamiento | Pipeline de middlewares estilo `net/http` de Go (`Auth` -> `RateLimit` -> `Validator` -> `Endpoint`) con cortocircuito temprano y `defer`. |
| **14** | [`14_worker_pool.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/14_worker_pool.aura) | **Worker Pool CSP** | Concurrencia | Concurrencia masiva Go con N workers concurrentes, canales con buffer para tareas y resultados, y sincronización con `WaitGroup`. |
| **15** | [`15_object_pool.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/15_object_pool.aura) | **Object Pool (sync.Pool)** | Rendimiento | Implementación de `sync.Pool` en memoria (`Get`, `Put`, `Reset`), demostrando el idioma `let buf = pool.Get(); defer pool.Put(buf);`. |
| **16** | [`16_dependency_injection.aura`](file:///Users/mavro/Projects/AuraProjects/design_patterns/V3/16_dependency_injection.aura) | **Dependency Injection (Pure DI)** | Arquitectura | Inversión de control por constructor con interfaces desacopladas, composition root centralizado y soporte para Mocks de testing. |

---

## 🚀 Guía de Ejecución

### 1. Ejecutar la Suite Completa v3

El script automatizado compila y verifica los tipos estáticos (`aurac check`) y ejecuta (`aurac run`) cada uno de los 16 patrones secuencialmente:

```bash
./V3/run_all.sh
```

### 2. Ejecutar un Patrón Individual

Puedes ejecutar cualquier archivo de la suite directamente con el compilador oficial de Aura:

```bash
# Patrón Factory Method
aurac run V3/01_factory_method.aura

# Patrón Worker Pool CSP
aurac run V3/14_worker_pool.aura

# Patrón Dependency Injection con Mocks
aurac run V3/16_dependency_injection.aura
```

### 3. Verificación de Tipos Estáticos (Type Checker)

```bash
aurac check V3/02_builder.aura
aurac check V3/10_observer.aura
```

---

## 💡 Lecciones Clave de Ingeniería en Aura v3

1. **Despacho Polimórfico Óptimo**:
   Al instanciar structs que implementan interfaces compartidas en Aura, incorporar un identificador de tipo explícito (o constructor `New...`) asegura que la resolución de métodos de interfaz satisfaga plenamente el despacho dinámico.

2. **Garantía Incondicional con `defer`**:
   Las sentencias `defer` se ejecutan en orden LIFO estricto al abandonar el ámbito de la función receptora, convirtiéndose en la herramienta ideal para la liberación de cerrojos de concurrencia (`p.mu.unlock()`), finalización de tareas de sincronización (`wg.done()`) y retorno de recursos al pool (`pool.Put(buf)`).

3. **Arquitectura Limpia (Clean Architecture)**:
   Al aplicar el principio de Go *"Accept interfaces, return structs"*, la capa de servicios (`UserService`) desconoce completamente si los datos son almacenados en Postgres, Redis o un Mock de memoria, garantizando una suite de software 100% desacoplada y testeable.
