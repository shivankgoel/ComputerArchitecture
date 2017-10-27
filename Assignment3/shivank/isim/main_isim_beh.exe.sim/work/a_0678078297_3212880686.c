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
static const char *ng0 = "E:/4th Sem/comp-arch/assignment3/shivank/rotateshift.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;
extern char *IEEE_P_2592010699;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);
char *ieee_p_1242562249_sub_2505484506_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2540846514_1035706684(char *, char *, char *, char *, int );
char *ieee_p_1242562249_sub_2547962040_1035706684(char *, char *, char *, char *, int );
char *ieee_p_2592010699_sub_3293060193_503743352(char *, char *, char *, char *, unsigned char );
char *ieee_p_2592010699_sub_393209765_503743352(char *, char *, char *, char *);


static void work_a_0678078297_3212880686_p_0(char *t0)
{
    char *t1;
    char *t2;
    unsigned int t3;
    unsigned int t4;
    unsigned int t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    char *t10;
    char *t11;

LAB0:    xsi_set_current_line(46, ng0);

LAB3:    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t3 = (4 - 3);
    t4 = (t3 * 1U);
    t5 = (0 + t4);
    t1 = (t2 + t5);
    t6 = (t0 + 3480);
    t7 = (t6 + 56U);
    t8 = *((char **)t7);
    t9 = (t8 + 56U);
    t10 = *((char **)t9);
    memcpy(t10, t1, 4U);
    xsi_driver_first_trans_fast(t6);

LAB2:    t11 = (t0 + 3400);
    *((int *)t11) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}

static void work_a_0678078297_3212880686_p_1(char *t0)
{
    char t6[16];
    char t12[16];
    char t23[16];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t7;
    char *t8;
    int t9;
    unsigned int t10;
    unsigned char t11;
    char *t13;
    char *t14;
    char *t15;
    int t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    unsigned int t24;
    unsigned char t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;

LAB0:    t1 = (t0 + 3080U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(48, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5460U);
    t4 = (t0 + 5559);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (1 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 != 0)
        goto LAB4;

LAB6:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5460U);
    t4 = (t0 + 5561);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (1 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 != 0)
        goto LAB7;

LAB8:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5460U);
    t4 = (t0 + 5563);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (1 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 != 0)
        goto LAB9;

LAB10:    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t2 = (t0 + 5460U);
    t4 = (t0 + 5565);
    t7 = (t6 + 0U);
    t8 = (t7 + 0U);
    *((int *)t8) = 0;
    t8 = (t7 + 4U);
    *((int *)t8) = 1;
    t8 = (t7 + 8U);
    *((int *)t8) = 1;
    t9 = (1 - 0);
    t10 = (t9 * 1);
    t10 = (t10 + 1);
    t8 = (t7 + 12U);
    *((unsigned int *)t8) = t10;
    t11 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t3, t2, t4, t6);
    if (t11 != 0)
        goto LAB11;

LAB12:
LAB5:    goto LAB2;

LAB4:    xsi_set_current_line(49, ng0);
    t8 = (t0 + 1032U);
    t13 = *((char **)t8);
    t8 = (t0 + 5428U);
    t14 = (t0 + 1672U);
    t15 = *((char **)t14);
    t14 = (t0 + 5492U);
    t16 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t15, t14);
    t17 = ieee_p_1242562249_sub_2505484506_1035706684(IEEE_P_1242562249, t12, t13, t8, t16);
    t18 = (t0 + 3544);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB5;

LAB7:    xsi_set_current_line(51, ng0);
    t8 = (t0 + 1032U);
    t13 = *((char **)t8);
    t8 = (t0 + 5428U);
    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t14 = (t0 + 5476U);
    t16 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t15, t14);
    t17 = ieee_p_1242562249_sub_2547962040_1035706684(IEEE_P_1242562249, t12, t13, t8, t16);
    t18 = (t0 + 3544);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB5;

LAB9:    xsi_set_current_line(53, ng0);
    t8 = (t0 + 1032U);
    t13 = *((char **)t8);
    t8 = (t0 + 5428U);
    t14 = (t0 + 1512U);
    t15 = *((char **)t14);
    t14 = (t0 + 5476U);
    t16 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t15, t14);
    t17 = ieee_p_1242562249_sub_2540846514_1035706684(IEEE_P_1242562249, t12, t13, t8, t16);
    t18 = (t0 + 3544);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t17, 32U);
    xsi_driver_first_trans_fast_port(t18);
    goto LAB5;

LAB11:    xsi_set_current_line(55, ng0);
    t8 = (t0 + 1032U);
    t13 = *((char **)t8);
    t8 = (t0 + 5428U);
    t14 = ieee_p_2592010699_sub_3293060193_503743352(IEEE_P_2592010699, t23, t13, t8, (unsigned char)0);
    t15 = (t23 + 12U);
    t10 = *((unsigned int *)t15);
    t10 = (t10 * 1U);
    t17 = (t0 + 1512U);
    t18 = *((char **)t17);
    t17 = (t0 + 5476U);
    t16 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t18, t17);
    t19 = xsi_vhdl_bitvec_sra(t19, t14, t10, t16);
    t20 = ieee_p_2592010699_sub_393209765_503743352(IEEE_P_2592010699, t12, t19, t23);
    t21 = (t12 + 12U);
    t24 = *((unsigned int *)t21);
    t24 = (t24 * 1U);
    t25 = (32U != t24);
    if (t25 == 1)
        goto LAB13;

LAB14:    t22 = (t0 + 3544);
    t26 = (t22 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t20, 32U);
    xsi_driver_first_trans_fast_port(t22);
    goto LAB5;

LAB13:    xsi_size_not_matching(32U, t24, 0);
    goto LAB14;

LAB1:    return;
}


extern void work_a_0678078297_3212880686_init()
{
	static char *pe[] = {(void *)work_a_0678078297_3212880686_p_0,(void *)work_a_0678078297_3212880686_p_1};
	xsi_register_didat("work_a_0678078297_3212880686", "isim/main_isim_beh.exe.sim/work/a_0678078297_3212880686.didat");
	xsi_register_executes(pe);
}
