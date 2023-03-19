# Reduced Controls for Castlevania Legends (Gameboy)

*By NaOH*

## Functionality

This is a mostly useless hack. It removes Sonia Belmont's ability to control her movement in mid-air, bringing it more in line with the other Castlevania games.

- Belmont can no longer change direction nor stop in mid-air
- (`-no-vcancel` patches only!) Belmont no longer begins falling again when the jump button is released. WARNING: there is at least one part of the game that will become difficult or impossible as a result.

This is patch is mostly intended as a joke, but it may be of legitimate interest to anyone looking for an extra challenge, or to players who are used to the usual classic-vania controls and are tripped up by this game's. For instance, one player has reported that this patch actually makes it easier to grab ropes.

## Patching Instructions

There are patches for each combination of rom (US/EU; JP) and for parameters selected (see "Functionality" above). Only one patch should be used.
Please note that the US and EU roms are the same. You may wish to verify your rom before patching by checking a hash (see "ROM HASHES" below).

Patch using FLIPS or any other IPS patcher. Please note that gameboy roms contain an internal checksum -- this
patch does not modify the checksum, but if you so desire you may wish to correct the checksum using a utilitiy such as rgbfix.
In any case, this is purely cosmetic because a real gameboy does not actually verify the checksum.

## Compatability with other hacks

This hack is very simple and the patches are entirely in-place, so it's extremely unlikely to cause conflicts with any other hack.

## Source Code

The assembly and build scripts for this hack are available on github. Please take a look.

    https://github.com/nstbayless/CVL-controls

## ROM Hashes

US/EU ROM (SGB Enhanced):
    MD5: 1475824e7262c0d6359f43c287e034a5
    SHA256: 56d3dee063b8801704a284bd1bc229b94f15a3a448f485d347f04283d9bd16d7
    CRC32: ad9c17fb

JP ROM (SGB Enhanced):
    MD5: 6761f77e6daa82120dd7c73adeec777e
    SHA256: 8e45c7d6b5498d4048653e92b2a792bb2eea00b2897a7711fb7be1b6bed0534f
    CRC32: 4825b25f
