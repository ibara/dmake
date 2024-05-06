/*
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at usr/src/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at usr/src/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 2003 Sun Microsystems, Inc. All rights reserved.
 * Use is subject to license terms.
 */

/*
 * bsdcompat.h: Interface definitions to BSD compatibility functions for SVR4.
 */

#ifndef _BSDCOMPAT_H
#define _BSDCOMPAT_H

#include <sys/param.h>  /* defines 'BSD' on *BSD systems */
#ifndef BSD
#include <bsd/stdlib.h>  /* libbsd getprogname() */
#endif

#include <signal.h>

/*
 * Needed on Linux (GLibc) and FreeBSD.
 * On Linux using bsd_signal works with C files but in C++ it fails.
 * Even when the prototypes are declared manually the linker will sill
 * somehow fail.
 */
#if defined(__GLIBC__) || defined(__FreeBSD__) || defined(__DragonFly__)
#define bsd_signal signal
#endif

#endif //!_BSDCOMPAT_H
