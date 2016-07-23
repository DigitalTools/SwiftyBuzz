# SwiftyBuzz
Swift + Orange Pi + Buzzer

# Setup

## Clone this repo

    git clone https://github.com/toolshc/SwiftyBuzz

## Go inside RGBSemaphore

    cd RGBSemaphore

## Build (will show errors)

    swift build

## Patch code

In

    Packages/CStatfs-1.0.0/module.modulemap

Replace

    x86_64-linux-gnu
   
by

    arm-linux-gnueabihf

## Build

    swift build

## Run

    sudo .build/debug/SwiftyBuzz

Buzzer will play Startwars melody


# Special thanks to:

[Swift for ARM](http://swift-arm.ddns.net/), thanks to [@iachievedit](https://github.com/iachievedit)

[SwiftyGPIO](https://github.com/uraimo/SwiftyGPIO), thanks to [@uraimo](https://github.com/uraimo)

Logic and melody based on [rpi-examples](https://github.com/leon-anavi/rpi-examples/blob/master/buzzer/c/starwars.c) by [@leon-anavi](https://github.com/leon-anavi)

Musical notes frecuencies calculated based [NoteFrecuency.swift](https://gist.github.com/NickEntin/7f0516a6c62ab0485720) by [@NickEntin](https://github.com/NickEntin)

