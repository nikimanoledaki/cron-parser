class Editor
    attr_reader :config_min, :config_hour, :command, :current_time

    def get(config, current_time)
        fields = config.split(' ')
        @config_min = fields[0]
        @config_hour = fields[1]
        @command = fields[2]
        @current_time = current_time
    end

    def time?
        if (config_hour == '*') && (config_min == '*')
            "#{current_time}"
        elsif config_min == '*'
            compare_hour
        elsif config_hour == '*'
            compare_min
        else 
            "#{config_hour}:#{config_min}"
        end
    end

    def compare_hour
        current_hour = current_time.split(':')[0]
        current_hour == config_hour ? "#{current_time}" : "#{config_hour}:00"
    end

    def compare_min
        timefields = current_time.split(':')
        current_hour = timefields[0]
        current_min = timefields[1]
        current_min <= config_min ? "#{current_hour.to_i}:#{config_min}" : "#{current_hour.to_i + 1}:#{config_min}"
    end

    def put
        cron_time = time?
        today = Time.new(current_time) <= Time.new(cron_time)
        cron_day = today == true ? "today" : "tomorrow"
        puts "#{cron_time} #{cron_day} - #{command}"
    end

end
