---
title: Recipes & Meal Planning
status: someday
keywords:
  - idea
  - recipes
  - meals
---
# Idea: Recipes & Meal Planning

Use recognitions to manage cooking, groceries, and nutrition.

## 1. Recognitions

- `RecipeRecognition`: ingredients, steps, time, difficulty, tags.
- `IngredientRecognition`: items with units and nutritional info.
- `PantryItemRecognition`: current stock.
- `MealPlanRecognition`: planned meals for a period.

## 2. Measurement and topology

- Topology:
  - recipes ↔ ingredients ↔ pantry; recipes ↔ days/meals.
- Measurement:
  - cost, prep time, nutrition (macros, micronutrients), variety.

Runbooks: `plan_weekly_meals`, `generate_grocery_list`, `review_meal_history`.
