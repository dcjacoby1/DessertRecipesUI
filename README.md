Dessert Cookbook by Dan Jacoby

Introduction:
-
Dessert Cookbook allows the User to find their favorite dessert recipies

User Stories:
- 
As a user, I would like to see all the desserts in alphabetical order
As a user, I would like to be able to select a dessert and see the instructions of how to make it
As a user, I would like to be able to select a dessert and see a list of ingredients and measurements

Application Structure:
-
                                    DessertRecipesApp
                                     ContentView
  DessertRow<------(child component)--DesertList ---(NavigationView(when dessert is clicked)) --> DessertDetail
                                      DessertAPI (uses Dessert model to pass dessert variable to DessertList)
                                                (uses Recipe model to pass recipe variable to DessertDetail)
