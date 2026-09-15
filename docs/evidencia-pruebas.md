# Evidencia de pruebas

Metodos de validacion usados en este ciclo:

- **CLI headless**: `Godot_v4.7.2-stable_win64.exe --headless --path <proyecto> --quit-after N` → exit 0 sin errores de script/parseo.
- **Tests temporales** (`--headless --script`): spawn (crea 1 obstaculo sin error) y FSM (transiciones de estado y reinicio). No se versionan en el repo.
- **Manual en el editor**: ejecutar el proyecto con F5 y jugar. Debe completarla el estudiante.

| Criterio | Version validada | Metodo o comando | Pasos | Resultado esperado | Resultado observado | Evidencia |
|---|---|---|---|---|---|---|
| Caida por gravedad continua y visible | `c2f9d22` | Manual (editor) | F5 y dejar de tocar el ave al iniciar la partida | Desciende acelerando hasta el piso y termina la partida | Pendiente de validacion visual por el estudiante | - |
| Impulso fijo por input | `c2f9d22` | Manual (editor) | F5, presionar espacio/click varias veces | Cada input aplica el mismo salto hacia arriba; no acumula fuerza | Pendiente de validacion visual por el estudiante | - |
| Generacion de obstaculos (pares, hueco 150, intervalo 300, Y aleatorio) | `c2f9d22` | CLI (spawn test) + manual | Test: `_spawn()` en headless; manual: F5 y observar pares | Se crea el par sin errores; en juego aparecen cada ~2 s con hueco fijo y posicion variable | `SPAWN_TEST_OK obstacles=1`, exit 0 | Salida de consola del test temporal |
| Puntaje +1 por par superado | `c2f9d22` | Test FSM + manual | Test: `_on_obstacle_passed()`; manual: cruzar pares sin chocar | Suma exactamente 1 por par | Test: score pasa 0→1 (assert OK); conteo visual pendiente en editor | `FSM_TEST_OK`, exit 0 |
| Colision con obstaculo o limite termina la partida | `c2f9d22` | Manual (editor) | F5, chocar contra un bloque o el techo/piso | Se congela el mundo y aparece GAME OVER con puntaje | Pendiente de validacion visual por el estudiante | - |
| Caso limite: rozar el borde del hueco | `c2f9d22` | Manual (editor) | Pasar el ave pegada al borde de un bloque sin tocarlo | Cuenta como pasada valida, sin fin de partida | Pendiente de validacion visual por el estudiante | - |
| Reinicio completo desde GAME OVER | `c2f9d22` | Test FSM + manual | Test: `_on_player_died()` → `_restart_game()`; manual: morir y pulsar input | Puntaje 0, posicion inicial (160,360), obstaculos limpios, estado PLAYING | Test: asserts OK (estado, score=0, posicion) | `FSM_TEST_OK`, exit 0 |
| Corregido: conexion de senal en spawn | `2eba7ab` | CLI (spawn test) | `_spawn()` en headless | Sin error de conexion y 1 obstaculo creado | `SPAWN_TEST_OK obstacles=1`, exit 0 | Salida de consola del test temporal |

## Fallos y limites pendientes

- Reproduccion: el crash del `spawner` (conexion de senal invalida) se reprodujo con el test temporal antes del arreglo y dejo de ocurrir luego de `2eba7ab`.
- Impacto: los criterios de juego (gravedad visual, impulso, conteo visual, colision, caso limite del borde) requieren un jugador humano en el editor; las validaciones headless solo cubren logica de estado, spawn y ausencia de errores.
- Decision: la validacion manual visual con F5 queda pendiente de ejecucion y registro por parte del estudiante.