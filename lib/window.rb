# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class SigProc < Array

    def hanning(i,n)
        0.5-0.5*Math.cos(2*Math::PI*i/(n))
    end

    def hamming(i,n)
        0.54-0.46*Math.cos(2*Math::PI*i/(n-1))
    end

    def blackman(i,n)
        0.42-0.5*Math.cos(2*Math::PI*i/(n-1))+0.08*Math.cos(4*Math::PI*i/(n-1))
    end

    def window(fn)
        r = []
        return each.with_index { |v,i| r << v*method(fn).call(i,size) }
    end

end
