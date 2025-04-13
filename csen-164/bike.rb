class Bike
    def initizilize(fgear, bgear, w)
        @fgear = fgear 
        @bgear = bgear
        @wheel = w
    end
    
    def gear_ratio
        @fgear / @bgear.to_f
    end

    def gear_inches
        gear_ratio * @wheel.diameter
    end
end