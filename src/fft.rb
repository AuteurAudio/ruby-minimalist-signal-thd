# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

class SigProc < Array

    def fft(win)
        float_pad
        window win   
        f = (fft_rec self).map { |i| i.magnitude.real }
                          .slice(0,(size/2))
                          .map { |i| i/Math.sqrt(size) }
        self.class.new(f)
    end
    
    def fft_rec(x)
        return x if x.size <= 1
        e = Array.new(x.size/2) { |i| x[2*i] }
        o = Array.new(x.size/2) { |i| x[2*i+1] }
        ffte = fft_rec(e)
        ffto = fft_rec(o)
        ffte.concat(ffte)
        ffto.concat(ffto)
        Array.new(x.size) { |i| ffte[i]+ffto[i]*w(-i,x.size) }
    end

    def w(i,n)
        Math::E**Complex(0,2*Math::PI*i/n)
    end

    private :fft_rec, :w

end
