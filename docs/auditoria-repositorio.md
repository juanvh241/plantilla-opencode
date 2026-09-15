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
| `docs/` | Plantillas de proceso PIAPC (9 documentos) | Listado del directorio |
| `AGENTS.md` | Reglas para agentes: no modificar sin alcance, sin contenido ficticio | Lectura del documento |

## Flujo observado

En el estado actual no existe logica de juego. El proyecto abre en el editor de Godot y ejecuta una escena vacia (sin escenas ni scripts propios todavia). El flujo esperado segun el GDD sera: input del jugador (espacio/click/tap) aplica un impulso vertical al personaje que cae por gravedad; el escenario avanza hacia la izquierda generando pares de obstaculos; al superar un par se suma 1 punto; cualquier colision termina la partida y un nuevo input reinicia.

## Pruebas y comandos disponibles

| Comando o prueba | Que verifica | Resultado inicial |
|---|---|---|
| Abrir `project.godot` en Godot 4.7.2 y ejecutar F5 | Que el proyecto base abre y ejecuta sin errores | No ejecutado aun (ejecucion manual en el editor; `godot` no esta en el PATH) |
| `git status` | Estado de archivos versionados | Repositorio inicializado, archivos sin commit inicial |

## Hechos, supuestos y preguntas abiertas

- Hechos comprobados: existe el proyecto base de Godot (config 4.7); no hay escenas, scripts, ni assets de juego todavia; no hay repositorio git previo (inicializado en este ciclo); `godot` no esta en el PATH.
- Supuestos por verificar: la version instalada del editor corresponde a 4.7.2; el renderer GL Compatibility funciona en la maquina.
- Preguntas para consultar: ¿version exacta del editor instalado? ¿se agrega un atajo de ejecucion por consola? ¿que resolucion de ventana se usara de referencia para las posiciones de juego?
