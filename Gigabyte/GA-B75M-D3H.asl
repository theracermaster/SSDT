#define DISABLE_USBX		1

DefinitionBlock ("SSDT-GA-B75M-D3H.aml", "SSDT", 2, "APPLE ", "General", 0x20151227)
{
	External (_SB.PCI0, DeviceObj)

	External (_SB.PCI0.RP05, DeviceObj)

	External (_SB.PCI0.RP05.PXSX, DeviceObj)

	#include "../include/7-Series.asl"

	Scope (\_SB.PCI0)
	{
		Name (PW94, Package () { 0x09, 0x04 })

		Scope (RP05)
		{
			// Disabling the PXSX device
			Scope (PXSX) { Name (_STA, Zero) }
			// Adding a new GIGE device
			Device (GIGE)
			{
				Name (_ADR, Zero)
				Alias (PW94, _PRW)
			}
		}
	}
}
