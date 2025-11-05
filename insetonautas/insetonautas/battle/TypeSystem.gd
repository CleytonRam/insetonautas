extends Node

# Sistema de tipos baseado nos papéis ecológicos dos insetos
enum Type {
	POLLINATOR,    # Polinizador
	PREDATOR,      # Predador
	PEST,          # Praga
	DECOMPOSER     # Decompositor
}

# Matriz de vantagens: atacante -> defensor -> multiplicador
var type_chart = {
	Type.POLLINATOR: {
		Type.PREDATOR: 2.0,
		Type.PEST: 1.0,
		Type.DECOMPOSER: 0.5
	},
	Type.PREDATOR: {
		Type.POLLINATOR: 0.5,
		Type.PEST: 2.0,
		Type.DECOMPOSER: 1.0
	},
	Type.PEST: {
		Type.POLLINATOR: 1.0,
		Type.PREDATOR: 0.5,
		Type.DECOMPOSER: 2.0
	},
	Type.DECOMPOSER: {
		Type.POLLINATOR: 2.0,
		Type.PREDATOR: 1.0,
		Type.PEST: 0.5
	}
}

func get_type_multiplier(attack_type: Type, defender_type: Type) -> float:
	if attack_type in type_chart and defender_type in type_chart[attack_type]:
		return type_chart[attack_type][defender_type]
	return 1.0
