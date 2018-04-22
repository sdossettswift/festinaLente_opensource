readme.md

![badge](https://travis-ci.org/sdossettswift/festinaLente_opensource.svg?branch=master)
## FESTINA LENTE
Festina Lente is a time tracking and billing system tailored to the needs of a boutique architectural studio. Festina Lente is built on the premise that the tool should work for the user, not impose a workflow. "Festina lente" is the Swift family motto, meaning "Make haste, carefully." This adage speaks to the value of thoughtful, yet efficient work.

There are two types of users: architects and administrators. The architects simply add time entries via familiar calendar interface. The app also captures client billing for prints, scans, and other reimbursable expenses.

Administrators can add clients, projects, billing contacts. The end product will enable admins to view reports, generate invoices, and track key performance indices.

<hr>

### Technology
#### Front End
The calendar interface is powered by FullCalendar.JS, using Moment.js, and
DateRangePicker.js for support. The program utilizes the Bootstrap framework, as
well as GoogleFonts, and FontAwesome.
#### Back End
The program is built in Ruby, on the Rails framework. Authentication is handled
through BCrypt. Data persists in a PostgreSQL database. Rails uses JBuilder to
generate JSON objects.
#### Testing & Deployment
TravisCI deploys to Heroku. Testing is handled using Minitest and Capybara. This
is the first project where I have explored RsÂ=pec.

<hr>

### To Do
* billing
* time sheet submittal
* invoicing

<hr>

### Images
![Entity Relationship Diagram](screenshots/entity_relationship_diagram.png)

#### Views
![Calendar View](screenshots/calendar_view.png)
- The calendar serves as the root page. To add events, you simply click on the calendar and drag the event to the desired time. Weekly view is the default; however, users can toggle between daily, weekly, and monthly views.
- Calendar entries are color coded based on the phase of the project, as per client's specifications.

![Event Log Modal](screenshots/event_log_modl.png)
- Once a user drags the calendar entry to the specified time period, they are prompted to add details for the time. Calendar entries are tied to a project, identified by phase, and annotated by 'description'.  
- Based on the ActiveRecord relationship between projects and clients, all events are also linked to the appropriate clients without the user having to specify a client. The entry is also tied to the user who creates it.  

![Client Detail](screenshots/client_detail.png)
- Entries, projects, expenses, and prints all belong to a client. The client detail page shows available information for each client in 'card' format. As expenses and invoices are added, they will appear on this page.

![Expenses](screenshots/expense_log_modal.png)
- Users can log expenses and miles in this form. Like entries, expenses are tied to a project (and a client, by virtue of the ActiveRecord association).
- Reimbursable expenses are easily billed back to clients.
- TODO: Future implementation can provide ability to upload a receipt.  

![Prints](screenshots/print_log.png)
- Users can log prints and scans in this form. These can be billed back to clients.

<hr>

# Deployment
Should you wish to deploy this app on your own, you are
welcome to do so.


### Prerequisites
- ruby 2.3.1p112
- Rails 5
- PostgreSQL
- Homebrew, TravisCI, Heroku (ideally, for this implementation at least!)
- There might be some additional gems to install globally to handle graphics, etc. I'm thinking Graphviz, Travis, Heroku...
  - `brew install graphviz`
  - `gem install travis`
  - `brew install heroku`

### How To
- clone repo
- create database: `rails db:create`
- migrate database: `rails db:migrate`
- bonus points to create, migrate at once: `rails db:setup`
- create a superuser via `rails console` / `rails c`
  - note: b/c the user is using b_crypt, set both the password and password_confirmation.
  - Also, set role as "Admin". From there, you'll be able to create additional users via the Admin Dashboard.
- get server running `rails s`
- create a client via Admin Dashboard
- create a project via Admin Dashboard
- create additional users via Admin Dashboard
- customize options in model files:
  - event phases
  - event colors
  - expense categories
  - print formats, etc.
  - user roles
- Create a heroku instance `heroku create`
- Configure TravisCI to deploy to Heroku
  `travis setup heroku`
    - update travis.yml file as needed
