# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class SigProc < Array

    def base_measure(window)
        x = debias.fft window
        i = x.max
        r = (Float(i)/10.0).ceil
        [x,i,r] 
    end

    def thdn(window=:hanning)
        x,i,r = base_measure window
        fund  = x.null_range_compliment(i,r).rms
        rest  = x.null_range(i,r).rms
        "THD+N: %.3f%% (%.1fdB)" % [100*rest/fund,db(rest/fund)]
    end

    def thd(window=:hanning)
        x,i,r = base_measure window
        t     = [(Float(size)/Float(i)).floor,15].max
        fund  = x.null_range_compliment(i,r).rms
        harm  = 0.0
        (2..t).each { |j| harm += x.null_range_compliment(j*i,r).rms }  # Scale the harmonic range?
        "THD:   %.3f%% (%.1fdB)" % [100*harm/fund,db(harm/fund)]
    end

    def sinad(window=:hanning)
        x,i,r = base_measure window
        total = x.rms
        rest  = x.null_range(i,r).rms
        "SINAD: %.2f (%.1fdB)" % [total/rest,db(total/rest)]
    end

    private :base_measure

end
