require 'editor.rb'

describe Editor do
    describe '#put' do
        it 'returns formatted cron job with specific time' do
            time = "16:01"
            config = ["30 1 /bin/run_me_daily\n"]
            subject.get(config, time)
            result = "1:30 tomorrow - /bin/run_me_daily\n"
            expect{subject.put}.to output(result).to_stdout
        end

        it 'returns cron job repeated every hour and minute' do
            time = "16:10"
            config = ["* * /bin/run_me_every_minute\n"]
            subject.get(config, time)
            result = "16:10 today - /bin/run_me_every_minute\n"
            expect{subject.put}.to output(result).to_stdout
        end

        it 'returns cron job repeated every hour at specific minute' do
            time = "16:46"
            config = ["45 * /bin/run_me_hourly\n"]
            subject.get(config, time)
            result = "17:45 today - /bin/run_me_hourly\n"
            expect{subject.put}.to output(result).to_stdout
        end

        it 'returns cron job repeated every minute of every specific hour' do
            time = "16:10"
            config = ["* 19 /bin/run_me_sixty_times\n"]
            subject.get(config, time)
            result = "19:00 today - /bin/run_me_sixty_times\n"
            expect{subject.put}.to output(result).to_stdout
        end

        it 'returns formatted list of cron jobs' do
            time = "16:10"
            config = ["30 1 /bin/run_me_daily\n", "45 * /bin/run_me_hourly\n", "* * /bin/run_me_every_minute\n", "* 19 /bin/run_me_sixty_times\n"]
            subject.get(config, time)
            result = "1:30 tomorrow - /bin/run_me_daily\n16:45 today - /bin/run_me_hourly\n16:10 today - /bin/run_me_every_minute\n19:00 today - /bin/run_me_sixty_times\n"
            expect{subject.put}.to output(result).to_stdout
        end
    end 
end
