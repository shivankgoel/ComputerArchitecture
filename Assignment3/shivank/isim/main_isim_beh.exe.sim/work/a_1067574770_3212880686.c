/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "E:/4th Sem/comp-arch/assignment3/shivank/Actrl.vhd";



static void work_a_1067574770_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    unsigned char t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 2352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(42, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (5 - 5);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)3);
    if (t9 != 0)
        goto LAB4;

LAB6:    xsi_set_current_line(49, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t5 = (5 - 3);
    t6 = (t5 * 1U);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t10 = (t0 + 2736);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t2, 4U);
    xsi_driver_first_trans_delta(t10, 0U, 4U, 0LL);

LAB5:    goto LAB2;

LAB4:    xsi_set_current_line(43, ng0);
    t10 = (t0 + 1032U);
    t11 = *((char **)t10);
    t12 = (2 - 5);
    t13 = (t12 * -1);
    t14 = (1U * t13);
    t15 = (0 + t14);
    t10 = (t11 + t15);
    t16 = *((unsigned char *)t10);
    t17 = (t16 == (unsigned char)3);
    if (t17 != 0)
        goto LAB7;

LAB9:    xsi_set_current_line(46, ng0);
    t2 = (t0 + 4318);
    t10 = (t0 + 2736);
    t11 = (t10 + 56U);
    t18 = *((char **)t11);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    memcpy(t20, t2, 4U);
    xsi_driver_first_trans_fast_port(t10);

LAB8:    goto LAB5;

LAB7:    xsi_set_current_line(44, ng0);
    t18 = (t0 + 4314);
    t20 = (t0 + 2736);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t18, 4U);
    xsi_driver_first_trans_fast_port(t20);
    goto LAB8;

LAB1:    return;
}


extern void work_a_1067574770_3212880686_init()
{
	static char *pe[] = {(void *)work_a_1067574770_3212880686_p_0};
	xsi_register_didat("work_a_1067574770_3212880686", "isim/main_isim_beh.exe.sim/work/a_1067574770_3212880686.didat");
	xsi_register_executes(pe);
}
