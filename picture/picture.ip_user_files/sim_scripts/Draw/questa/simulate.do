onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib Draw_opt

do {wave.do}

view wave
view structure
view signals

do {Draw.udo}

run -all

quit -force
