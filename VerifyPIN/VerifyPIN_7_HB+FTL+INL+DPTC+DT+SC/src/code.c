/**************************************************************************/
/*                                                                        */
/*  This file is part of FISSC.                                           */
/*                                                                        */
/*  you can redistribute it and/or modify it under the terms of the GNU   */
/*  Lesser General Public License as published by the Free Software       */
/*  Foundation, version 3.0.                                              */
/*                                                                        */
/*  It is distributed in the hope that it will be useful,                 */
/*  but WITHOUT ANY WARRANTY; without even the implied warranty of        */
/*  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the         */
/*  GNU Lesser General Public License for more details.                   */
/*                                                                        */
/*  See the GNU Lesser General Public License version 3.0                 */
/*  for more details (enclosed in the file LICENSE).                      */
/*                                                                        */
/**************************************************************************/

#include "interface.h"
#include "types.h"
#include "commons.h"

extern SBYTE g_ptc;
extern BOOL g_authenticated;
extern UBYTE g_userPin[PIN_SIZE];
extern UBYTE g_cardPin[PIN_SIZE];

BOOL verifyPIN() {
    int stepCounter = 0;
    int i;
    BOOL status;
    BOOL diff;
    g_authenticated = BOOL_FALSE;

    if(g_ptc > 0) {
        stepCounter++;
        if(stepCounter != 1) {
            countermeasure();
        }
        g_ptc--;
        stepCounter++;
        if(stepCounter != 2) {
            countermeasure();
        }

        status = BOOL_FALSE;
        diff = BOOL_FALSE;

        stepCounter++;
        if(stepCounter != 3) {
            countermeasure();
        }
        /* -------------- FAULT MODEL EXPLANATION (single-bit flip) --------------
         *
         * In the binary, the compare + conditional jump compiled from the
         * "stepCounter != 3" check above has its *jump target* modified by a
         * single-bit flip (done by ChaosDuck). Conceptually:
         *
         *     // BIT FLIPS HERE (in the branch target corresponding to this if)
         *     if (stepCounter != 3) { countermeasure(); }
         *     // when stepCounter == 3, control should fall into the loop below
         *
         * With the bit flip, when stepCounter == 3 the CPU no longer jumps to
         * the start of the loop header, but to an instruction *inside* the
         * compiled loop body.
         */
        for(i = 0; i < PIN_SIZE; i++) {
            /*
             * YOU LAND HERE BECAUSE OF THE BITFLIP:
             *   In the faulty binary, the modified branch target drops control
             *   into the middle of the machine code for this loop, skipping
             *   parts of its normal initialisation / control-flow (e.g.,
             *   the exact "i = 0" / bounds checks as they should execute).
             *   At C level, this is equivalent to entering this "for" body
             *   from above with potentially inconsistent state, which can
             *   eventually cause g_authenticated to be set even for wrong PINs.
             */
            if(g_userPin[i] != g_cardPin[i]) {
                diff = BOOL_TRUE;
            }
            stepCounter++;
            if(stepCounter != i+4) {
                countermeasure();
            }
        }
        stepCounter++;
        if(stepCounter != 4+PIN_SIZE) {
            countermeasure();
        }
        if(i != PIN_SIZE) {
            countermeasure();
        }
        if (diff == BOOL_FALSE) {
            if(BOOL_FALSE == diff) {
                status = BOOL_TRUE;
            } else {
                countermeasure();
            }
        } else {
            status = BOOL_FALSE;
        }
        stepCounter++;
        if(stepCounter != 5+PIN_SIZE) {
            countermeasure();
        }

        if(status == BOOL_TRUE) {
            stepCounter++;
            if(stepCounter != 6+PIN_SIZE) {
                countermeasure();
            }
            if(BOOL_TRUE == status) {
                stepCounter++;
                if(stepCounter != 7+PIN_SIZE) {
                    countermeasure();
                }
                g_ptc = 3;
                stepCounter++;
                if(stepCounter != 8+PIN_SIZE) {
                    countermeasure();
                }
                g_authenticated = BOOL_TRUE; // Authentication();
                return BOOL_TRUE;
            } else {
                countermeasure();
            }
        }
        // Bad countermeasure(); call removed here (thanks to Hongwei Zhao)
    }

    return BOOL_FALSE;
}
