# Cron Parser

## Description
A command line program that parses a config file containing one or more mini-cron jobs. It outputs the next time that this cron task will be performed and whether this will be today or tomorrow.

## Running the command line program
From within the folder:
```
cat input.txt | ruby lib/cron_parser.rb 16:10
=> 1:30 tomorrow - /bin/run_me_daily
=> 16:45 today - /bin/run_me_hourly
=> 16:10 today - /bin/run_me_every_minute 
=> 19:00 today - /bin/run_me_sixty_times
```

If you would like to test the program from outside the folder with your own test input, make sure to change the path to the ```cron_parser.rb``` file accordingly.

## Setting up the application
Install the gems:
```
bundle install
```

## Testing the application
After you have installed the ```gems```, run the tests with rspec:
```
rspec
```
