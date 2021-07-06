class AlertConfig
    def initialize(t, dc, tc)
        @title = t
        @div_class = dc
        @title_class = tc
    end

    def title
        @title
    end

    def div_class
        @div_class
    end

    def title_class
        @title_class
    end
end