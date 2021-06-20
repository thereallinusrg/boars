# Proposal for Semester Project

**Patterns & Trends in Environmental Data / Computational Movement
Analysis Geo 880**

| Semester:      |  FS21                                 |
|----------------|---------------------------------- |
| **Title:**     |  Similarly Moving Boars & Corridor Detection                         |
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

## Results / products

<!-- Which results/products do you expect, anticipate? -->

## Data

<!-- What data will you use? Will you require additional context data? Where do you get this data from? Do you already have all the data? -->

## Analytical concepts

<!-- Which analytical concepts will you use? What conceptual movement spaces and respective modelling approaches of trajectories will you be using? What additional spatial analysis methods will you be using? -->
- Raster the whole data extend
- For each raster cell:
  - Draw a grid (depicted on the right --> )
  - Compute trajectory for each animal
  - Convert Trajectory to "Chess String"
- Use EDR on all Chess Strings in a cell

​

Find Corridors​

Check for same Chess Strings​

​

Find similarly moving Boars​

Check for Animals with low EDRs

## R concepts

<!-- Which R concepts, functions, packages will you mainly use. What additional spatial analysis methods will you be using? -->

## Risk analysis

<!-- What could be the biggest challenges/problems you might face? What is your plan B? -->

## Questions? 

<!-- 
Which questions would you like to discuss at the coaching session? 

For questions regarding the data: Please file an issue here: https://github.com/ComputationalMovementAnalysis/ComputationalMovementAnalysisData/issues

-->
