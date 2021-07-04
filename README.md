# Similarly Moving Boars & Corridor Detection 

**Patterns & Trends in Environmental Data / Computational Movement
Analysis GEO 880**

| Semester:      |  FS21                                 |
|----------------|---------------------------------- |
| **Student 1:** |  Linus Rüegg                                 |
| **Student 2:** |  Eric Tharmalingam                |


## Abstract 

<!-- A short abstract of your project proposal (50-60 words) -->
**Similarly Moving Boars**
- Which animals move similarly?
  - Even at different times!
**Corridor Detection**
- Which animals use the same corridors?
  - Where are those located?

## Research Questions

<!-- What are the research questions of your project? (50-60 words) -->

R1: How can trajectories be modeled to find similarity in movement?

R2: How can common corridors used by several animals be detected?


## Analytical concepts

<!-- Which analytical concepts will you use? What conceptual movement spaces and respective modelling approaches of trajectories will you be using? What additional spatial analysis methods will you be using? -->
- Raster the whole data extend
- For each raster cell:
  - Draw a grid 
  - Compute trajectory for each animal
  - Convert Trajectory to "Chess String"
- Use EDR on all Chess Strings in a cell

- Find Corridors
  - Find highly frequented grid cells

- Find similarly moving Boars
  - Check for Animals with low EDRs


