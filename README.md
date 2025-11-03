# AmjapOS

AmjapOS is a custom, lightweight operating system designed for learning, experimentation, and low-level system development. This project is ideal for enthusiasts exploring kernel programming, bootloaders, and OS architecture.

## Features

- Minimal kernel written from scratch
- Bootable via BIOS/UEFI
- Custom memory management
- Basic input/output handling
- Supports running on QEMU for testing
- Modular design for easy expansion
- Also im planning to add Networking on future

## Requirements

- x86_64-compatible processor
- [QEMU](https://www.qemu.org/) or real hardware for testing
- GNU Compiler Collection (GCC) 

## Getting Started

### Clone the repository

```bash
git clone https://github.com/battletupaz-tech/MyOS.git
cd MyOS
qemu-system-x86_64 -kernel mykernel.bin
