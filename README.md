# Cron Parser

## Installation 
```
clone
bundle install
```

## Usage
From within the folder:
```
cat input.txt | ruby lib/cron_parser.py 16:10
=> 1:30 tomorrow - /bin/run_me_daily
=> 16:45 today - /bin/run_me_hourly
=> 16:10 today - /bin/run_me_every_minute 
=> 19:00 today - /bin/run_me_sixty_times
```

## Test
```
rspec
```
