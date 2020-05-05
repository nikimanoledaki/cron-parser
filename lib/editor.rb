class Editor
    attr_reader :fields, :current_time

    def get(config, current_time)
        @fields = config.split(' ')
        @current_time = current_time
    end

    def put
        command = @fields[2]
        if fields[1] && fields[0] == '*'
            puts "#{@current_time} today - #{command}"
        else 
            cron_time = "#{@fields[1]}:#{@fields[0]}"
            today = Time.new(current_time) <= Time.new(cron_time)
            day = today == true ? "today" : "tomorrow"
            puts "#{cron_time} #{day} - #{command}"
        end
    end

end
