class Editor
    attr_reader :config, :time

    def get(config, time)
        @config = config
        @time = time
    end

    def put
        puts @config
        puts @time
    end

end
