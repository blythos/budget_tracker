# Budget Tracker
I built a budget tracking app in Ruby with a Sinatra backend. The brief for this project was:

### Spending Tracker

Build an app that allows a user to track their spending.

#### Inspired by:
Monzo, MoneyDashboard, lots of mobile/online banking apps

#### User Stories / Acceptance Criteria - MVP

| As a  | I want to be able to  | So that |
|---|---|---|
| User | Specify who I am spending money with | I can track who I frequently shop with |
| User | Use tags to categorise my spending|I can easily see what I’m spending money on |
| User | Add tags, merchants, and amount spent to transactions| I can easily view full details about a transaction|
| User | View all of my transactions in a single page | I can easily view the full details of all of my transactions in one place|


#### Acceptance Criteria - MVP

User should be able to:
* Create, edit and delete merchants, e.g. Tesco, Amazon, ScotRail
* Create, edit and delete tags for their spending, e.g. groceries, entertainment, transport
* Assign tags and merchants to a transaction, as well as an amount spent on each transaction.
* The app should display all the transactions a user has made in a single view, with each transaction's amount, merchant and tag, and a total for all transactions.

#### Acceptance Criteria - Possible Extensions:
* Transactions should have a timestamp, and the user should be able to view transactions sorted by the time they took place.
* The user should be able to supply a budget, and the app should alert the user somehow when when they are nearing this budget or have gone over it.
* The user should be able to filter their view of transactions, for example, to view all transactions in a given month, or view all spending on groceries.

## Screenshot
<img src="images/budget-tracker.png" width=700 />


## Running the App
If you want to see this in action, you'll need Ruby and PostGreSQL installed. Do the following in your terminal:

1. Run the command `createdb budget_tracker` to set up the database.
2. From the root of the project, run `psql -d budget_tracker -f db/budget_tracker.sql' to set up the tables and relationships
3. Populate the tables with seed data using `ruby db/seeds.rb` 
4. Run the Sinatra server with `ruby controller.rb`
5. Visit http://localhost:4567/ in your browser for access

You can end the server any time by pressing CTRL + C in the terminal window that's running the process. Thanks for checking it out!
