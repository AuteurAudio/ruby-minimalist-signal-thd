# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

require 'test/unit'
require '../lib/sig_proc.rb'

class TestSigProc < Test::Unit::TestCase

    def test_thd
        length, freq, m = 4096, 10, 7
        x = SigProc.new(length) { |x| Math.sin(freq*2*Math::PI*x/length) + 0.00121*Math.sin(m*freq*2*Math::PI*x/length) }
        assert_equal('THD:   0.121% (-58.3dB)',x.thd)
    end

    def test_thdn
        length, freq, m = 8192, 14, 9
        x = SigProc.new(length) { |x| Math.sin(freq*2*Math::PI*x/length) + 0.00121*Math.sin(m*freq*2*Math::PI*x/length) }
        assert_equal('THD+N: 0.121% (-58.3dB)',x.thdn)
    end

    def test_sinad
        length, freq, m = 16384, 22, 13
        x = SigProc.new(length) { |x| Math.sin(freq*2*Math::PI*x/length) + 0.00121*Math.sin(m*freq*2*Math::PI*x/length) }
        assert_equal('SINAD: 826.45 (58.3dB)',x.sinad)
    end

end
