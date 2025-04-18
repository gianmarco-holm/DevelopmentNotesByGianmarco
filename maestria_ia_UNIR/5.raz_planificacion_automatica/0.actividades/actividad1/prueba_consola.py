#!/usr/bin/env python
# coding: utf-8

"""Cuaderno_Actividad_1_Búsqueda.py

Actividad:  Resolución de problema mediante búsqueda heurística

Importante:

El código siguiente es el que debe usarse para la ejecución de la actividad.
En caso de requerir modificaciones se subirán ficheros de sustitución al aula de la asignatura

Code based on simple-ai GameWalkPuzzle example
2024 Modified by: Alejandro Cervantes
Remember installing pyplot and flask if you want to use WebViewer

Para instalar requisitos:

    % pip install simpleai flask pydot graphviz

Nota: graphviz puede requerir una instalación independiente

"""

from __future__ import print_function

from simpleai.search.viewers import BaseViewer, ConsoleViewer, WebViewer
from simpleai.search import (
    SearchProblem,
    astar,
    breadth_first,
    depth_first,
    uniform_cost,
)


class GameWalkPuzzle(SearchProblem):

    def __init__(self, board, costs, heuristic_number):
        self.board = board
        self.goal = (0, 0)
        self.costs = costs
        self.heuristic_number = heuristic_number
        for y in range(len(self.board)):
            for x in range(len(self.board[y])):
                if self.board[y][x].lower() == "t":
                    self.initial = (x, y)
                elif self.board[y][x].lower() == "p":
                    self.goal = (x, y)

        super(GameWalkPuzzle, self).__init__(initial_state=self.initial)

    def actions(self, state):
        actions = []
        for action in list(self.costs.keys()):
            newx, newy = self.result(state, action)
            if self.board[newy][newx] != "#":
                actions.append(action)
        return actions

    def result(self, state, action):
        x, y = state

        if action.count("up"):
            y -= 1
        if action.count("down"):
            y += 1
        if action.count("left"):
            x -= 1
        if action.count("right"):
            x += 1

        new_state = (x, y)
        return new_state

    def is_goal(self, state):
        return state == self.goal

    def cost(self, state, action, state2):
        return self.costs[action]

    # Esta función heurística es la distancia entre el estado actual
    # el objetivo (único) identificado como self.goal
    def heuristic1(self, state):
        x, y = state
        gx, gy = self.goal
        return abs(x - gx) + abs(y - gy)

    def heuristic2(self, state):
        x, y = state
        gx, gy = self.goal
        return max(abs(x - gx), abs(y - gy))

    def heuristic3(self, state):
        x, y = state
        gx, gy = self.goal
        return 2 * (abs(x - gx) + abs(y - gy))

    def heuristic(self, state):
        if self.heuristic_number == 1:
            return self.heuristic1(state)
        elif self.heuristic_number == 2:
            return self.heuristic2(state)
        elif self.heuristic_number == 3:
            return self.heuristic3(state)
        else:
            raise Exception(
                "El número de la función heurística debe estar entre 1 y 3. Revise la inicialización del problema."
            )


def searchInfo(problem, result, use_viewer):
    def getTotalCost(problem, result):
        originState = problem.initial_state
        totalCost = 0
        for action, endingState in result.path():
            if action is not None:
                totalCost += problem.cost(originState, action, endingState)
                originState = endingState
        return totalCost

    res = "Total length of solution: {0}\n".format(len(result.path()))
    res += "Total cost of solution: {0}\n".format(getTotalCost(problem, result))

    if use_viewer:
        stats = [
            {"name": stat.replace("_", " "), "value": value}
            for stat, value in list(use_viewer.stats.items())
        ]

        for s in stats:
            res += "{0}: {1}\n".format(s["name"], s["value"])
    return res


def resultado_experimento(problem, MAP, result, used_viewer):
    path = [x[1] for x in result.path()]

    for y in range(len(MAP)):
        for x in range(len(MAP[y])):
            if (x, y) == problem.initial:
                print("T", end="")
            elif (x, y) == problem.goal:
                print("P", end="")
            elif (x, y) in path:
                print("·", end="")
            else:
                print(MAP[y][x], end="")
        print()

    info = searchInfo(problem, result, used_viewer)
    print(info)


def main(MAP_ASCII, COSTS, algorithms, heuristic_number=1):
    MAP = [list(x) for x in MAP_ASCII.split("\n") if x]

    for algorithm in algorithms:
        problem = GameWalkPuzzle(MAP, COSTS, heuristic_number)
        # used_viewer=BaseViewer()
        # Solo funcionan en script .py
        # used_viewer = ConsoleViewer()
        used_viewer = WebViewer()

        # Mostramos tres experimentos
        print("Experimento con algoritmo {}:".format(algorithm))

        result = algorithm(problem, graph_search=True, viewer=used_viewer)
        resultado_experimento(problem, MAP, result, used_viewer)


# Configuración y llamada para el caso 1
# Se ejecutan los algoritmos de búsqueda en amplitud y búsqueda en profundidad

MAP_ASCII = """
########
#    P #
# #### #
#  T # #
# ##   #
#      #
########
"""

COSTS = {
    "left": 1.0,
    "right": 1.0,
    "up": 1.0,
    "down": 1.0,
}

algorithms = (breadth_first, depth_first)
main(MAP_ASCII, COSTS, algorithms)


# # Configuración y llamada para el caso 2
# # Se utiliza el mismo mapa pero se varían los costes

# MAP_ASCII = """
# ########
# #    P #
# # #### #
# #  T # #
# # ##   #
# #      #
# ########
# """

# COSTS = {
#     "left": 2.0,
#     "right": 2.0,
#     "up": 5.0,
#     "down": 5.0,
# }

# algorithms=(breadth_first,uniform_cost,astar)
# main (MAP_ASCII,COSTS,algorithms)


# # Configuración y llamada para el caso 3
# # Se utiliza el mismo mapa y se usan diferentes heurísticas

# MAP_ASCII = """
# ########
# #    P #
# # #### #
# #  T # #
# # ##   #
# #      #
# ########
# """

# COSTS = {
#     "left": 2.0,
#     "right": 2.0,
#     "up": 1.0,
#     "down": 1.0,
# }

# algorithms=(astar,)
# main (MAP_ASCII,COSTS,algorithms,1)
# main (MAP_ASCII,COSTS,algorithms,2)
# main (MAP_ASCII,COSTS,algorithms,3)
