# 🏛️ 50 Ejemplos de Patrones de Diseño en Aura Language (`V4`)

Colección exhaustiva, modular y totalmente ejecutable de **50 patrones de diseño y arquitectura de software**, implementados de forma idiomática aprovechando las fortalezas únicas de **Aura Language** (Tipos Suma Algebraicos ADTs, Duck Typing estructural implícito, Concurrencia CSP con Fibers & Channels, Inmutabilidad, Sentencias `defer`, pipelines `|>` y funciones de orden superior).

---

## 📂 Clasificación de los 50 Patrones

### 🏗️ Patrones Creacionales (01 - 05)
* [01_factory_method.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/01_factory_method.aura): Factory Method con ADTs y constructores seguros.
* [02_abstract_factory.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/02_abstract_factory.aura): Familias de componentes desacoplados (Dark / Light Theme).
* [03_builder.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/03_builder.aura): Fluent API inmutable para configuración de servidores.
* [04_prototype.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/04_prototype.aura): Clonación y especialización con extensión funcional (`...base`).
* [05_singleton.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/05_singleton.aura): Inicialización thread-safe atómica mediante `Once.new()`.

### 🧩 Patrones Estructurales (06 - 12)
* [06_adapter.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/06_adapter.aura): Adaptador unificado para pasarelas de pago dispares.
* [07_bridge.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/07_bridge.aura): Desacoplamiento de abstracción (Control Remoto) e implementación (Dispositivos).
* [08_composite.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/08_composite.aura): Árbol recursivo algebraico para archivos y directorios.
* [09_decorator.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/09_decorator.aura): Decoración dinámica y apilamiento de formateadores de texto.
* [10_facade.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/10_facade.aura): Fachada de orquestación de audio, video y subtítulos.
* [11_flyweight.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/11_flyweight.aura): Estado intrínseco compartido para miles de entidades gráficas.
* [12_proxy.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/12_proxy.aura): Proxy interceptor con memoria caché en RAM.

### 🔄 Patrones de Comportamiento GoF (13 - 23)
* [13_chain_of_responsibility.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/13_chain_of_responsibility.aura): Pipeline de middlewares (Auth, Roles, Handlers).
* [14_command.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/14_command.aura): Encapsulación de acciones con soporte de `execute` y `undo`.
* [15_interpreter.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/15_interpreter.aura): Evaluación de expresiones lógicas booleanas y ASTs.
* [16_iterator.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/16_iterator.aura): Recorrido secuencial (`hasNext`, `next`) sin exponer la estructura interna.
* [17_mediator.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/17_mediator.aura): Centralización de mensajería desacoplada entre participantes.
* [18_memento.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/18_memento.aura): Captura y restauración de estados previos de un lienzo gráfico.
* [19_observer.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/19_observer.aura): Suscripción y difusión 1-a-N de variaciones en cotizaciones de bolsa.
* [20_state.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/20_state.aura): Máquina de estados finita exhaustiva y segura en compilación.
* [21_strategy.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/21_strategy.aura): Algoritmos de cálculo impositivo intercambiables en tiempo de ejecución.
* [22_template_method.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/22_template_method.aura): Algoritmo plantilla ETL con pasos inyectados.
* [23_visitor.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/23_visitor.aura): Algoritmos separados de jerarquías geométricas (Áreas, XML).

### ⚡ Concurrencia CSP & Sistemas Distribuidos (24 - 30)
* [24_worker_pool.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/24_worker_pool.aura): Pool de fibers de trabajo coordinados con `Channel` y `WaitGroup`.
* [25_pipeline.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/25_pipeline.aura): Tubería de flujo de datos asíncrono en etapas.
* [26_producer_consumer.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/26_producer_consumer.aura): Desacoplamiento de producción y consumo con colas acotadas.
* [27_barrier.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/27_barrier.aura): Sincronización multi-fiber en punto de control común.
* [28_future_promise.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/28_future_promise.aura): Canal de un solo valor para resultados diferidos.
* [29_cancellation_token.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/29_cancellation_token.aura): Detención controlada y limpia de bucles concurrentes.
* [30_read_write_lock.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/30_read_write_lock.aura): Lectura no bloqueante con escritura exclusiva.

### 🏛️ Arquitectura & Resiliencia Cloud (31 - 40)
* [31_dependency_injection.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/31_dependency_injection.aura): Inversión de control pura con interfaces Duck-Typing.
* [32_repository.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/32_repository.aura): Abstracción de acceso a datos en memoria o bases de datos.
* [33_unit_of_work.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/33_unit_of_work.aura): Transacciones agrupadas con `commit` y `rollback`.
* [34_circuit_breaker.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/34_circuit_breaker.aura): Prevención de fallos en cascada (Closed, Open, HalfOpen).
* [35_retry.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/35_retry.aura): Reintento automático con límite de tolerancia a fallos.
* [36_rate_limiter.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/36_rate_limiter.aura): Limitación de tráfico con Token Bucket.
* [37_event_sourcing.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/37_event_sourcing.aura): Reconstrucción de estado mediante reproducción de eventos del dominio.
* [38_cqrs.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/38_cqrs.aura): Separación explícita de comandos de mutación y consultas optimizadas.
* [39_saga.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/39_saga.aura): Transacciones distribuidas con pasos compensatorios en reversa.
* [40_outbox.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/40_outbox.aura): Publicación atómica de eventos mediante bandeja de salida transaccional.

### λ Patrones Funcionales Modernos (41 - 45)
* [41_pipeline_functional.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/41_pipeline_functional.aura): Composición elegante con operador forward pipe `|>`.
* [42_currying.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/42_currying.aura): Aplicación parcial y descomposición de cálculos fiscales.
* [43_monad_result.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/43_monad_result.aura): Manejo determinista de errores con `Result<T, E>`.
* [44_option_maybe.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/44_option_maybe.aura): Ausencia segura de valores con `Option<T>` (sin nulos).
* [45_closure_factory.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/45_closure_factory.aura): Cierres léxicos y encapsulación estricta de estado mutable.

### ⚙️ Rendimiento, Sistemas & Extensibilidad (46 - 50)
* [46_object_pool.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/46_object_pool.aura): Reciclaje de instancias pesadas con la primitiva nativa `Pool`.
* [47_defer_resource_cleanup.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/47_defer_resource_cleanup.aura): RAII y liberación determinista de descriptores mediante `defer`.
* [48_service_locator.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/48_service_locator.aura): Registro dinámico y localización de componentes.
* [49_interceptor.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/49_interceptor.aura): Cadena de interceptores HTTP para logging, auth y telemetría.
* [50_plugin_system.aura](file:///Users/mavro/Projects/AuraProjects/design-patterns/V4/50_plugin_system.aura): Arquitectura modular desacoplada de plugins extensibles.

---

## 🚀 Cómo Ejecutar

Para ejecutar toda la suite de los 50 patrones de diseño secuencialmente:

```bash
cd V4
./run_all.sh
```

O para ejecutar cualquier patrón de forma individual:

```bash
aurac run V4/01_factory_method.aura
aurac run V4/24_worker_pool.aura
aurac run V4/34_circuit_breaker.aura
```
