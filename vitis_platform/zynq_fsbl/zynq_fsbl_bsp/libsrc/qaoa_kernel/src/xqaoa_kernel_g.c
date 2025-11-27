#include "xqaoa_kernel.h"

XQaoa_kernel_Config XQaoa_kernel_ConfigTable[] __attribute__ ((section (".drvcfg_sec"))) = {

	{
		"xlnx,qaoa-kernel-1.0", /* compatible */
		0x40000000 /* reg */
	},
	 {
		 NULL
	}
};