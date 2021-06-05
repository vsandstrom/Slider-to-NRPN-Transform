# Slider-to-NRPN-Transform.scd
Transforming data from gui-slider into 14bit nrpn-midi standard. 

Takes integer values from slider, converts, splits and stores the values in variables for Most Significant and Least Significand Byte. 

TODO: Make implementation plug n play for use with external NRPN-midi gear, through a default midi out. As is it only reads values from slider and sorts
after the NRPN-Midi standard when it comes to MSB and LSB. Should not be hard to copy paste in your own midi-send script. 
