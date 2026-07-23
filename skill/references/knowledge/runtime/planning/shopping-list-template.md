# Shopping List Construction

Build the list only after the user confirms:

- number of people;
- number of days;
- selected recipes;
- exclusions and allergies;
- ingredients already available.

## Calculation

1. Read every selected recipe file.
2. Multiply only quantities explicitly stated in the recipe.
3. Do not multiply or invent quantities marked `unknown` or “to taste.”
4. Merge identical ingredients using compatible units.
5. Round purchasing quantities transparently and identify the rounding.
6. Separate required and optional ingredients.

## Polish store departments

Use these sections when appropriate:

- `Warzywa i owoce`
- `Pieczywo`
- `Kasze, ryż i makarony`
- `Konserwy i rośliny strączkowe`
- `Produkty chłodnicze`
- `Mrożonki`
- `Orzechy, nasiona i bakalie`
- `Przyprawy i dodatki`

Do not claim current stock or price without checking the relevant shop.
