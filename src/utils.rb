# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class SigProc < Array

    def rms
        total = 0.0
        each { |x| total += x**2 }
        Math.sqrt(total/size)
    end

    def debias
        x = self.class.new(self)
        mean = x.average 
        x.map { |i| i-mean }
        x
    end
    
    def average 
        total = 0.0
        each { |x| total += x }
        total/size
    end

    def max
        each_with_index.max[1]
    end

    def db(x)
        20*Math.log(x)/Math.log(10)
    end

end
