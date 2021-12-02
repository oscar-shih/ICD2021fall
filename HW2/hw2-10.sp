*********************************************
.inc '90nm_bulk.l'

.SUBCKT   Sum DVDD GND A B Ci Co S
MM0-A 	  	A-bar   A      DVDD       DVDD      PMOS l=0.1u w=0.5u  m=1
MM1-A 	  	A-bar   A      GND        GND       NMOS l=0.1u w=0.25u m=1

MM0-B     	X       B      A-bar      A-bar     PMOS l=0.1u w=0.5u  m=1
MM1-B     	X       B      A          A         NMOS l=0.1u w=0.25u m=1
MM2-B    	X       A-bar  B          B         PMOS l=0.1u w=0.5u  m=1
MM3-B     	X       A      B          B         NMOS l=0.1u w=0.25u m=1

MM0-Ci   	Ci-bar  Ci     DVDD       DVDD      PMOS l=0.1u w=0.5u  m=1
MM1-Ci   	Ci-bar  Ci     GND        GND       NMOS l=0.1u w=0.25u m=1

MM0-X     	Y       X      Ci         Ci        PMOS l=0.1u w=0.5u  m=1
MM1-X     	Y       X      Ci-bar     Ci-bar    NMOS l=0.1u w=0.25u m=1
MM2-X     	Y       Ci     X          X         PMOS l=0.1u w=0.5u  m=1
MM3-X     	Y       Ci-bar X          X         NMOS l=0.1u w=0.25u m=1

MM0-S 	  	S       Y      DVDD       DVDD      PMOS l=0.1u w=0.5u  m=1
MM1-S 	  	S       Y      GND        GND       NMOS l=0.1u w=0.25u m=1
*********************************************
MM0-B-2		n1	B	DVDD	   DVDD      PMOS l=0.1u w=0.5u  m=1
MM1-A-2		Z	A	n1	   n1        PMOS l=0.1u w=0.5u  m=1

MM2-A-2		Z	A	n4	   n4	     NMOS l=0.1u w=0.25u m=1
MM3-B-2		n4	B	GND	   GND	     NMOS l=0.1u w=0.25u m=1

MM4-A-2		n2	A	DVDD	   DVDD      PMOS l=0.1u w=0.5u  m=1
MM5-B-2		n2	B	DVDD	   DVDD      PMOS l=0.1u w=0.5u  m=1
MM6-Ci-2		Z	Ci	n2	   n2        PMOS l=0.1u w=0.5u  m=1

MM7-Ci-2		Z	Ci	n3	   n3        NMOS l=0.1u w=0.25u m=1
MM8-A-2		n3	A	GND	   GND       NMOS l=0.1u w=0.25u m=1
MM9-B-2		n3	B	GND	   GND       NMOS l=0.1u w=0.25u m=1

MM10-Z		Co	Z	DVDD	   DVDD      PMOS l=0.1u w=0.5u  m=1
MM11-Z		Co	Z	GND	   GND       NMOS l=0.1u w=0.25u m=1
.ENDS
*********************************************
Vdd	DVDD 	0 	1
Vss	GND  	0 	0
Vin1	A	0	pulse(0 1 7u 100n 100n 800n 2u)
Vin2	B	0	pwl(0n 0v 3u 0v 3.1u 1v 3.9u 1v 4u 0v 5u 0v 5.1u 1v 5.9u 1v 6u 0v 11u 0v 11.1u 1v 11.9u 1v 12u 0v 13u 0v 13.1u 1v 13.9u 1v 14u 0v 15u 0v)
Vin3	Ci	0	pulse(0 1 1u 100n 100n 800n 4u)

x1 DVDD GND A B Ci Co S Sum

.tran 500n 15u
.op
.option post
.end
