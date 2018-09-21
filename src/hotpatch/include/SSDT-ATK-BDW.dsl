#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "hack", "atk", 0)
{
#endif
    External (ATKP, IntObj)
    External (_SB.ATKD, DeviceObj)
    External (_SB.ATKD.IANE, MethodObj)
    External (_SB.KBLV, FieldUnitObj)
    External (_SB.PCI0.LPCB.EC0, DeviceObj)
    External (_SB.PCI0.LPCB.EC0.WRAM, MethodObj)
    Scope (_SB.ATKD)
    {
        Name (BOFF, 0)
        Method (SKBL, 1, NotSerialized)
        {
            If ((Arg0 == 0xED) || (Arg0 == 0xFD))
            {
                If ((Arg0 == 0xED) && (^BOFF == 0xEA))
                {
                    Local0 = 0
                    ^BOFF = Arg0
                }
                Else
                {
                    If ((Arg0 == 0xFD) && (^BOFF == 0xFA))
                    {
                        Local0 = 0
                        ^BOFF = Arg0
                    }
                    Else
                    {
                        Return (^BOFF)
                    }
                }
            }
            Else
            {
                If ((Arg0 == 0xEA) || (Arg0 == 0xFA))
                {
                    Local0 = ^^KBLV
                    ^BOFF = Arg0
                }
                Else
                {
                    Local0 = Arg0
                    ^^KBLV = Arg0
                }
            }
            Local1 = DerefOf (KBPW [Local0])
            ^^PCI0.LPCB.EC0.WRAM (0x04B1, Local1)
            Return (Local0)
        }
        Name (KBPW, Buffer ()
        {
            0x00, 0x10, 0x20, 0x30, 0x40, 0x50, 0x60, 0x70, 0x80, 0x90, 0xA0, 0xB0, 0xC0, 0xD0, 0xE0, 0xF0, 0xFF
        })
        Method (GKBL, 1, NotSerialized)
        {
            If (Arg0 == 0xFF)
            {
                Return (^BOFF)
            }
            Return (^^KBLV)
        }
    }
    
    Scope (_SB.PCI0.LPCB.EC0)
    {   
        Method (_Q0A, 0, NotSerialized) // F1 key
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x5E)
            }
        }
        
        Method (_Q0B, 0, NotSerialized) // F2 key
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x7D)
            }
        }
        
        Method (_Q0E, 0, NotSerialized) // F5 key
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x20)
            }
        }

        Method (_Q0F, 0, NotSerialized) // F6 key
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x10)
            }
        }
        
        Method (_Q11, 0, NotSerialized) // F8 key
        {
            If (ATKP)
            {
                \_SB.ATKD.IANE (0x61)
            }
        }
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif