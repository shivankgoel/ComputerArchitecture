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
static const char *ng0 = "E:/4th Sem/comp-arch/assignment3/shivank/shift2.vhd";



static void work_a_0162411442_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned char t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 2352U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(43, ng0);
    t2 = xsi_get_transient_memory(2U);
    memset(t2, 0, 2U);
    t3 = t2;
    memset(t3, (unsigned char)2, 2U);
    t4 = (t0 + 2736);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 2U);
    xsi_driver_first_trans_delta(t4, 30U, 2U, 0LL);
    xsi_set_current_line(44, ng0);
    t2 = xsi_get_transient_memory(7U);
    memset(t2, 0, 7U);
    t3 = t2;
    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t9 = (23 - 23);
    t10 = (t9 * -1);
    t11 = (1U * t10);
    t12 = (0 + t11);
    t4 = (t5 + t12);
    t13 = *((unsigned char *)t4);
    memset(t3, t13, 7U);
    t6 = (t0 + 2736);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t14 = (t8 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t2, 7U);
    xsi_driver_first_trans_delta(t6, 0U, 7U, 0LL);
    xsi_set_current_line(45, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t10 = (23 - 23);
    t11 = (t10 * 1U);
    t12 = (0 + t11);
    t2 = (t3 + t12);
    t4 = (t0 + 2736);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    memcpy(t8, t2, 24U);
    xsi_driver_first_trans_delta(t4, 6U, 24U, 0LL);
    goto LAB2;

LAB1:    return;
}


extern void work_a_0162411442_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0162411442_3212880686_p_0};
	xsi_register_didat("work_a_0162411442_3212880686", "isim/main_isim_beh.exe.sim/work/a_0162411442_3212880686.didat");
	xsi_register_executes(pe);
}
