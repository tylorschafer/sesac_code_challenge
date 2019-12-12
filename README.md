# sesac_code_challenge

## Overview
* This repo contains the code for the Bot saves princess 1 and 2 challenges. I had a lot of fun playing around with the 2 dimensional matrix logic in these challenges. The following documentation will outline local setup, how to run on Hacker Rank, and the 4 categories of assessment laid out in the challenge directions.

## Local Setup
* This codebase was written with ruby 2.4.1, all dependencies are located in the Gemfile.
	* Fork and/or Clone down this repo
	* run `cd sesac_code_challenge`
	* run `bundle install`
	* Once all dependencies have been installed you can run the RSpec test suite with the command `rspec`

## Running the challeng on Hacker Rank
* Loading this code into Hacker Rank should be fairly simple.
    1. Copy all methods within the class file of the corresponding challenge on Hacker Rank.
    2. Copy all methods within the `CharacterFinder` module.
    3. With all these methods copied over, the challenge will pass all tests on Hacker Rank.

## Design
* I have chosen a fairly simple design pattern for these two challenges.
    * Each "game" is contained within its own class object within the `/app` directory.
    * Each "game" class contains the unique code needed to run that challenge.
    * Methods have been designed to have a single responsibility.
    * Methods that are used amongst both games are located in the `/modules` directory.
    * All testing for this repo is located within the `/spec` directory.

## Testing
* All testing is done through the RSpec testing suite.
    * Every single method contained in the code base has its own dedicated testing block to ensure optimal code functionality.
    * All tests were written before functionality to maintain a TDD/BDD workflow

## Readability
* Great care has been taken to ensure the readability of this code base. I like to think that if your code is readable, there becomes much less reason to leave comments all over the place.
    * All methods are named to correspond with their single responsibility
    * Variables have been named to directly convey their contents

## Git / Github
* The repo for this project should convey a TDD workflow with consistency in commit messages.     * No one commit should contain an overabundance of functionality.
    * Each commit message should clearly convey its changes
    * Class functionality and refactors are merged into master from Independent branches
    * Pull Requests utilize a template that overviews the exact changes being merged into master.
