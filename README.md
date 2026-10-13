# AI & ML Semester 3 — Prolog Practicals (Unit 1 and Unit 2)

**Student:** Vishal Nayak  
**Course:** B.Tech CSE (AI & ML), Semester 3  
**Dialect:** SWI-Prolog  
**Coverage:** 12 practicals from the supplied Unit 1 and Unit 2 practical list

This repository contains 12 standalone Prolog source files, grouped by unit. Each program includes comments and an example query. The `tests/` directory contains a test suite for checking representative behavior across all 12 practicals.

## Practical index

| No. | Unit | Program | Main concept |
|---:|---|---|---|
| 1 | Unit 1 — Introduction to AI and Intelligent Agents | `practical_01_knowledge_base.pl` | Facts, predicates, rules, student-course database |
| 2 | Unit 1 | `practical_02_arithmetic_factorial_fibonacci.pl` | Arithmetic, factorial, recursive Fibonacci and Fibonacci series |
| 3 | Unit 1 | `practical_03_list_operations.pl` | Append, reverse, member search, list length |
| 4 | Unit 1 | `practical_04_college_timetable.pl` | Timetable database and queries |
| 5 | Unit 1 | `practical_05_student_classification.pl` | Rule-based topper/average/fail classification |
| 6 | Unit 2 — Problem Solving and Searching | `practical_06_breadth_first_search.pl` | Breadth-First Search (BFS) |
| 7 | Unit 2 | `practical_07_greedy_best_first_search.pl` | Greedy Best-First Search using `h(n)` |
| 8 | Unit 2 | `practical_08_a_star_search.pl` | A* Search using `f(n) = g(n) + h(n)` |
| 9 | Unit 2 | `practical_09_hill_climbing.pl` | Hill Climbing optimization |
| 10 | Unit 2 | `practical_10_simulated_annealing.pl` | Simulated Annealing and probabilistic moves |
| 11 | Unit 2 | `practical_11_map_coloring_csp.pl` | Map-coloring CSP with backtracking |
| 12 | Unit 2 | `practical_12_n_queens.pl` | N-Queens with backtracking |

## Requirements

- SWI-Prolog.
- No third-party packages are needed. Practical 10 uses the `random` library included with SWI-Prolog; the test suite uses the built-in `plunit` testing library.

## Run an individual practical

Open a terminal in the extracted `AI_ML_Prolog_Practicals_Sem3` project folder and start a file. For example:

```bash
swipl -s unit_1_introduction_to_ai/practical_01_knowledge_base.pl
```

At the `?-` prompt, enter a query such as:

```prolog
student_course(vishal, Course).
```

Press `;` to see another answer, or press Enter to stop searching for more answers. Enter `halt.` to exit SWI-Prolog.

Windows users can run the same command if `swipl` is on the system PATH, or open SWI-Prolog and consult the file using a forward-slash path.

## Run the test suite

From the project root, run:

```bash
swipl -q -s tests/run_tests.pl
```

The suite exercises representative queries from each of the 12 programs. It is a convenient final check after downloading or editing the files.

## Example query for each practical

| Practical | Example query |
|---:|---|
| 1 | `student_course(vishal, Course).` |
| 2 | `factorial(5, Result).` and `fibonacci_series(8, Series).` |
| 3 | `my_reverse([1,2,3,4], Result).` |
| 4 | `faculty_classes(dr_sharma, Classes).` |
| 5 | `student_result(riya, Result).` |
| 6 | `bfs_path(s, g, Path).` |
| 7 | `greedy_best_first(s, g, Path).` |
| 8 | `a_star(s, g, Path, Cost).` |
| 9 | `hill_climb(0, BestX, BestValue).` |
| 10 | `simulated_annealing(15, 1000, BestX, BestValue).` |
| 11 | `map_coloring(Assignment).` |
| 12 | `n_queens(4, Positions).` |

## Notes

- The student names, timetable entries, graph edges, and heuristic values are demonstration data; adapt them to the examples in your lab manual if needed.
- Practical 5 uses these example thresholds: topper `>= 85%`, average/pass `>= 50% and < 85%`, and fail `< 50%`. Adjust them if your faculty gives different thresholds.
- Greedy Best-First Search prioritizes the heuristic and does not guarantee the least-cost path. A* combines path cost and heuristic estimate.
- Hill Climbing uses a single-peaked sample objective. Simulated Annealing uses a sample objective with a local peak and a higher global peak; its search path is stochastic.
- Use outputs from your own SWI-Prolog run in your practical record if screenshots are required, and make sure you understand the code for your viva.

## Suggested GitHub repository name

`AI-ML-Semester-3-Prolog-Practicals`
