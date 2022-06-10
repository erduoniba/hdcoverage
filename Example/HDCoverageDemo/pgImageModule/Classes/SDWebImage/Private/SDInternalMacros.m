/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#import "SDInternalMacros.h"

void jx_executeCleanupBlock(__strong jx_cleanupBlock_t *block) { (*block)(); }
