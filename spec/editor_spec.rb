require 'editor.rb'

describe Editor do
    describe '#put' do
        it 'returns formatted list' do
            time = "16:01"
            config = "30 1 /bin/run_me_daily\n"
            subject.get(time, config)
            result = "1:30 tomorrow - /bin/run_me_daily\n"
            expect{subject.put}.to output(result).to_stdout
        end

        # it 'returns formatted list' do
        #     time = "16:01"
        #     config = ["30 1 /bin/run_me_daily\n", "45 * /bin/run_me_hourly\n", "* * /bin/run_me_every_minute \n", "* 19 /bin/run_me_sixty_times\n"]
        #     result = "1:30 tomorrow - /bin/run_me_daily\n16:45 today - /bin/run_me_hourly\n16:10 today - /bin/run_me_every_minute\n19:00 today - /bin/run_me_sixty_times"
        #     expect{subject.get(time, config)}.to output(result).to_stdout
        # end
    end 
end
