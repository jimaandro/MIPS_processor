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



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_01587853117894545518_3094179330_init();
    work_m_00935462145772402389_3502763270_init();
    work_m_09522637549210385232_1329913837_init();
    work_m_10981336708327320324_1044332945_init();
    work_m_10036864520879824645_3643072315_init();
    work_m_16541823861846354283_2073120511_init();


    xsi_register_tops("work_m_10036864520879824645_3643072315");
    xsi_register_tops("work_m_16541823861846354283_2073120511");


    return xsi_run_simulation(argc, argv);

}
