*********************************************
.inc '90nm_bulk.l'

.SUBCKT NR2 DVDD GND In-A In-B Out
*.PININFO DVDD:I GND:I In-A:I In-B:I Out:O

MM0-A node1 In-A DVDD  DVDD  PMOS l=0.1u w=0.5u  m=1
MM0-B Out   In-B node1 node1 PMOS l=0.1u w=0.5u  m=1
MM1-A Out   In-A GND   GND   NMOS l=0.1u w=0.25u m=1
MM1-B Out   In-B GND   GND   NMOS l=0.1u w=0.25u m=1
.ENDS
*********************************************


Vdd DVDD 0 1
Vss GND  0 0
Vin1 In-A 0 pulse(0 1 3u 100n 100n 800n 2u)
Vin2 In-B 0 pulse(0 1 1u 100n 100n 800n 4u)

x1 DVDD GND In-A In-B Out NR2

.tran 10n 7u
.op
.option post
.end
