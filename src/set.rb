# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class SigProc < Array

    def float_pad
        map { |i| Float(i) }
        new_length   = 2**(Math.log(count)/Math.log(2)).ceil
        concat_array = Array.new(new_length-size) { 0.0 }
        concat concat_array
    end

    def null_range(center,width)
        x = self.class.new(self)
        (center-width..center+width).each { |i| x[i] = 0.0 }        
        x
    end

    def null_range_compliment(center,width)
        x = self.class.new(self)
        (0..center-width-1).each          { |i| x[i] = 0.0 }
        (center+width+1..count-1).each    { |i| x[i] = 0.0 }
        x
    end

end
