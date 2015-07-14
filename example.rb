# A Minimalist Ruby THD / THD+N / SINAD Implimentation
# Copyright (c) 2015, Colin Shaw
# Distributed under the terms of the MIT License

require './lib/sig_proc.rb'

length, freq = 4096, 10

x = SigProc.new(length) { |x| Math.sin(freq*2*Math::PI*x/length) + 0.00121*Math.sin(7*freq*2*Math::PI*x/length) }
p x.thd 
p x.thdn 
p x.sinad 
