class Editor
    attr_reader :fields, :current_time

    def get(config, current_time)
        @fields = config.split(' ')
        @current_time = Time.new(current_time)
    end

    def put
        cron_time = "#{@fields[1]}:#{@fields[0]}"
        command = fields[2]
        puts "#{cron_time} #{day?(cron_time)} - #{command}"
    end

    def day?(cron_time)
        today = @current_time <= Time.new(cron_time)
        day = today == true ? "today" : "tomorrow"
    end

end
