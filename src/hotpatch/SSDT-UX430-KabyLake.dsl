// SSDT for Zenbook UX430 (Kabylake)

DefinitionBlock ("", "SSDT", 2, "hack", "ux430kl", 0)
{
    #define NO_DEFINITIONBLOCK
    
    // audio
    #include "include/SSDT-ALC295.dsl"
    #include "include/layout14_HDEF.asl"
    
    // battery
    #include "include/SSDT-BATT.dsl"
    
    // keyboard backlight/fn keys/als
    #include "include/SSDT-ATK-KABY.dsl"
    #include "include/SSDT-RALS.dsl"
    #include "include/SSDT-ALSC.dsl"
    
    // backlight
    #include "include/SSDT-PNLF.dsl"
    
    // disable DGPU
    #include "include/SSDT-RP01_PEGP.dsl"
    
    // usb
    #include "include/SSDT-XHC.dsl"
    #include "include/SSDT-USBX.dsl"
    #include "include/SSDT-UIAC-UX430-KABY.dsl"
    
    // others
    #include "include/SSDT-HACK.dsl"
    #include "include/SSDT-PTSWAK.dsl"
    #include "include/SSDT-LPC.dsl"
    #include "include/SSDT-IGPU.dsl"
}