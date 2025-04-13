class Wheel 
    attr_accessor(:rim, :tire)
    def initizilize(r,t)
        @rim = r 
        @rim = t 
    end

    def diameter
        rim + 2*tire #wor if we have accessor 
        #@rim + 2*@tire
    end

    =begin
    def rim 
        @rim
    end
   end


end
