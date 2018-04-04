# RSPEC
- Ruby Specification

Structure:
- Given some context
- When some event occurs
- Then I expect some outcome
** Given... When... Then **

DSL - domain specific language

## Why test?
- Why not? Test; Money
- Finds bugs
- Edge case coverage
- Stimulates critical thinking
- Exposes poorly written code (code smells)
- Confidence when refactoring/improving code
- Ability to upgrade related software
- Confidence when adding features
- deployment confidence
- saves time, headaches, anxiety
- reduce technical debt
- make complexity manageability

## Thinking in User Stories
- description of UX
- goals
- planning tool
- communication tool w/devs, clients
- describes a single step
- think of happy paths; unhappy paths
- define feature scope, edge cases
- perfectly sized portion of code for testing
- no spaghetti code
- 1:1 ratio of story to spec

## Writing Good Tests
- What to test? Only the parts you need to work
- depends on complexity
- existing code: write tests by priorities

## TEST
1. Happy path
1. unhappy path
1. edge cases
1. any bug that gets fixed

## DONT TEST
1. basic ruby
1. basic ROR
1. Third Party APIs
1. Behaviors tested elsewhere

## Other advice
- broken tests are awful
- partial/bad tests are deceiving
- keep suite fast
- run often
- before push
- commitment to keep all tests passing
- avoid brittle tests

## Installing RSPEC
- use v3 or later
- github.com/rspec/rspec
- docs
- gem install rpsec will install 5 gems

## Configuration
- color vs no color -- no-color is default
- format
- profile
- fail-fast
- order: defined or random
