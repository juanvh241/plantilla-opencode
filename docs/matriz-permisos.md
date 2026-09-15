# Matriz de permisos

Completa esta matriz antes de habilitar acciones de un agente. Una accion no declarada debe considerarse prohibida hasta consultar.

| Accion | Estado | Alcance o justificacion |
|---|---|---|
| Leer archivos del proyecto | Permitida | Requerido para auditar y especificar |
| Buscar rutas y simbolos | Permitida | Requerido para auditar y especificar |
| Editar archivos previstos | Permitida | Codigo y documentacion dentro del alcance aprobado |
| Ejecutar scripts documentados | Permitida | Ejecucion del juego por CLI si Godot esta en PATH; verificaciones de git |
| Instalar dependencias | Prohibida | No autorizado |
| Usar red | Prohibida | No autorizado |
| Publicar o subir cambios | Prohibida | Push a remoto no autorizado; solo commits locales |
| Acceder a secretos o credenciales | Prohibida | No corresponde al trabajo. |

## Condiciones de detencion

- Ante ambiguedades de diseno (criterios del GDD no verificables).
- Si una ejecucion o validacion falla sin causa comprendida.
- Si un cambio previsto excede el alcance de la parte en curso.
- Si se requiere alguna accion marcada como prohibida (red, instalar, publicar).
