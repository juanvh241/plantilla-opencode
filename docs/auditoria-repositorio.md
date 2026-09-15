# Auditoria del repositorio

## Objetivo

Registrar hechos verificables sobre la estructura, arquitectura y validacion del proyecto antes de proponer cambios.

## Rutas y simbolos relevantes

| Ruta o simbolo | Rol observado | Evidencia |
|---|---|---|
| `project.godot` | Proyecto Godot base: config_version=5, nombre "flappy bird IA", features `4.7` + `GL Compatibility`, renderer gl_compatibility, stretch canvas_items/aspect expand, fisicas 3D Jolt | Lectura del archivo |
| `.gitignore` | Excluye `.godot/` y `/android/` (Godot 4) + reglas de seguridad de la plantilla (`.env`, `.env.*`, `.DS_Store`, `Thumbs.db`) | Lectura del archivo |
| `.gitattributes` | Normaliza EOL a LF en archivos de texto | Lectura del archivo |
| `.editorconfig` | Charset utf-8 para el proyecto | Lectura del archivo |
| `icon.svg` + `icon.svg.import` | Icono del proyecto y metadatos de importacion | Archivos presentes junto a `project.godot` |
| `GDD.md` | Intencion de diseno completa: movimiento, obstaculos, puntaje, colision y pantallas | Lectura del documento |
| `scenes/player.tscn` + `scripts/player.gd` | Jugador: gravedad 900 px/s2, impulso -350 px/s, X fija en 160 | Lectura de escena y script |
| `scenes/obstacle.tscn` + `scripts/obstacle.gd` | Par de bloques superior/inferior (hueco 150 px, bloques 70x1000) con scroll 150 px/s a la izquierda | Lectura de escena y script |
| `scripts/obstacle_spawner.gd` | Genera pares cada 300 px con posicion vertical aleatoria (100-620) | Lectura de script |
| `scenes/main.tscn` | Escena principal: Player + ObstacleSpawner | Lectura de escena |
| `docs/` | Plantillas de proceso PIAPC (9 documentos) | Listado del directorio |
| `AGENTS.md` | Reglas para agentes: no modificar sin alcance, sin contenido ficticio | Lectura del documento |

## Flujo observado

En el estado actual no existe logica de juego. El proyecto abre en el editor de Godot y ejecuta una escena vacia (sin escenas ni scripts propios todavia). El flujo esperado segun el GDD sera: input del jugador (espacio/click/tap) aplica un impulso vertical al personaje que cae por gravedad; el escenario avanza hacia la izquierda generando pares de obstaculos; al superar un par se suma 1 punto; cualquier colision termina la partida y un nuevo input reinicia.

## Pruebas y comandos disponibles

| Comando o prueba | Que verifica | Resultado inicial |
|---|---|---|
| `Godot_v4.7.2-stable_win64.exe --headless --path <proyecto> --quit-after 10` | Importa escenas, ejecuta 10 frames y reporta errores de parseo/script | Salida de exit code 0, sin errores (validado el 2026-09-15) |
| Abrir el proyecto en el editor (F5) | Que el juego se ve y responde al input de forma visual | Ejecutado por el estudiante |

## Hechos, supuestos y preguntas abiertas

- Hechos comprobados: existe el proyecto base de Godot (config 4.7); el binario del editor es Godot 4.7.2.stable.official y esta en `Downloads` (no en el PATH del sistema); el proyecto corre 10 frames en headless sin errores; hay jugador con gravedad/impulso y escena principal.
- Supuestos por verificar: el renderer GL Compatibility funciona visualmente en la maquina (validacion manual con F5 pendiente); resolucion base 480x720 asumida (pendiente de confirmacion).
- Preguntas para consultar: ¿confirmas la resolucion de base 480x720? ¿se agrega al PATH el binario de Godot para automatizar pruebas?
