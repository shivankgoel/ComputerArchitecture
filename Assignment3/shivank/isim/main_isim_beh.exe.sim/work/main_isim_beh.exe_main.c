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

#include "xsi.h"

struct XSI_INFO xsi_info;

char *IEEE_P_2592010699;
char *STD_STANDARD;
char *STD_TEXTIO;
char *IEEE_P_3499444699;
char *IEEE_P_3620187407;
char *IEEE_P_1242562249;
char *IEEE_P_3564397177;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_1242562249_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    work_a_1352617883_3212880686_init();
    work_a_2784791081_3212880686_init();
    work_a_3465545410_3212880686_init();
    work_a_1935305228_3212880686_init();
    work_a_0290344353_3212880686_init();
    std_textio_init();
    ieee_p_3564397177_init();
    xilinxcorelib_a_3892810987_2959432447_init();
    xilinxcorelib_a_3541679604_1709443946_init();
    xilinxcorelib_a_0647000386_0543512595_init();
    xilinxcorelib_a_0269563783_3212880686_init();
    work_a_2789343399_3523452672_init();
    work_a_4100369738_3212880686_init();
    work_a_0161294233_3212880686_init();
    work_a_0162411442_3212880686_init();
    work_a_1111616105_3212880686_init();
    work_a_4148906950_3212880686_init();
    work_a_1692869334_3212880686_init();
    xilinxcorelib_a_2567975329_0543512595_init();
    xilinxcorelib_a_2856728265_3212880686_init();
    work_a_2681158754_3494191449_init();
    work_a_3073701636_3212880686_init();
    work_a_1067574770_3212880686_init();
    work_a_2188085564_3212880686_init();
    work_a_0678078297_3212880686_init();
    work_a_0286164271_3212880686_init();


    xsi_register_tops("work_a_0286164271_3212880686");

    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);
    STD_STANDARD = xsi_get_engine_memory("std_standard");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3564397177 = xsi_get_engine_memory("ieee_p_3564397177");

    return xsi_run_simulation(argc, argv);

}
