# my-cheatsheet

<title>my-cheatsheet</title>

# Shell

- `openvt` to run a program on a new virtual console

# Emacs

- `C-x C-s` to save
- `C-x C-c` to exit
- `C-g` to quit a partially entered command
- `M-v and C-v` to move to the previous or next screen
- `C-p and C-n` to move to the previous or next line
- `C-b and C-f` to move to the previous or next character
- `M-b and M-f` to move to the previous or next word
- `C-a and C-e` to move to the beginning or end of a line
- `M-a and M-e` to move to the beginning or end of a sentence
- `M-< and M->` to move to the beginning or end of the whole text
- `C-u N something` repeat
- `C-d` to delete the next character
- `M-<DEL> or M-d` to delete the previous or next word
- `C-<SPC>` to begin the mark set
- `C-w` to kill
- `C-y` to yank
- `C-/ or C-x u` to undo
- `C-x C-f` to find a file
- `C-x C-b` to list buffers
- `C-x b something` to switch buffer

# Framebuffer

See betteros.org/tut/graphics1.php

Thank you *prushik*!

    #include <linux/fb.h>
    #include <stdio.h>
    #include <stdint.h>
    #include <stdlib.h>
    #include <math.h>
    #include <fcntl.h>
    #include <sys/mman.h>
    #include <sys/ioctl.h>

    int fb_fd;
    struct fb_fix_screeninfo finfo;
    struct fb_var_screeninfo vinfo;
    long screensize;
    uint8_t *fbp;

    static void init(void) {
        fb_fd = open("/dev/fb0",O_RDWR);
        //Get variable screen information                                             
        ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo);
        vinfo.grayscale=0;
        vinfo.bits_per_pixel=32;
        ioctl(fb_fd, FBIOPUT_VSCREENINFO, &vinfo);
        ioctl(fb_fd, FBIOGET_VSCREENINFO, &vinfo);
        ioctl(fb_fd, FBIOGET_FSCREENINFO, &finfo);
        screensize = vinfo.yres_virtual * finfo.line_length;
        fbp = mmap(0, screensize, PROT_READ | PROT_WRITE, MAP_SHARED, fb_fd, (off_t)0);
    }

    static inline int putpixel(int x, int y, uint8_t r, uint8_t g, uint8_t b) {
        if (x >= vinfo.xres || x < 0 || y >= vinfo.yres || y < 0) return -1;
        long location = (x+vinfo.xoffset) * (vinfo.bits_per_pixel/8) + (y+vinfo.yoffset) * finfo.line_length;
        uint32_t color = (r<<vinfo.red.offset) | (g<<vinfo.green.offset) | (b<<vinfo.blue.offset);
        *((uint32_t*)(fbp + location)) = color;
        return 0;
    }

# Quotes

About Wirth's law:
- What Intel giveth, Microsoft taketh away.
- The speed of software halves every 18 months. (Gates' law)
- Software efficiency halves every 18 months, compensating Moore's law. (David May's law)

BetterOS.org/index:

> BetterOS.org is dedicated to freely providing software to you, which runs better.

> Today's computers have gotten very fast. Moore's Law states the the number of transistors that can be built into a microchip will double every two years. Theoretically, this means that (in general) the speed of a computer doubles every two years. This law has held true for a long time now. Computer processors get faster and use less power as technology advances.

> So, a computer from two years ago should be twice as slow as a new computer today, correct? That would be true, if computers were only hardware, but computers also need software to perform any kind of useful task. Wirth's Law states that computer software is becoming slower faster than computer hardware is becoming faster.

> The modern software developer has gotten lazy. When computer programming was beginning, programmers had to be careful with resource usage, and to make sure their programs ran as efficiently as possible. Many programs were written in assembly or C, and highly optimized. Then computers got faster, and faster, and faster, and now today, programmers write code in C# or Java, which get compiled to byte-code (not machine code) and interpreted by a virtual machine, and use garbage collection, because today's programmers can't even manage memory properly, I can't think of a better way to waste resources. Nowadays, everybody is worried about "going green" and conserving our planet's natural resources, but in the meantime we are wasting all of our computer machine's resources.

> How do programmers get away with writing such bad code, you ask? They don't care, and many of them believe that computers are so fast now that no one will notice. Unfortunately, nobody is noticing, but the only reason is because nobody knows what good software looks like anymore. Computers 20 years ago could run with 4 megabytes of memory and less than 20 megabytes of hard drive storage, now we have 3 terabyte hard drives, or solid state drives, and 16 gigabytes of memory, and we still use all of it. We don't do new things, we watch videos, write documents, browse the web, so why do we need all that RAM and hard drive space?

> Because application programming has gone to hell.

# Thank You

## Fabrice Bellard

- a French computer programmer
- FFmpeg, TCC, QEMU
- 2004 TCCBOOT
- 2005 Analog or DVB-T Digital TV transmitter by directly generating a VHF signal from a standard PC and VGA card.
- 2011 jslinux
- bellard.org
- fabrice at bellard dot org
- born in 1972 in Grenoble, France
- wrote LZEXE at age 17
- studied at l'École Polytechnique and Télécom Paris
- cleanly-styled C, data compression, numerical methods, signal processing, pertinent abstractions, media formats, open-source licensing, and “by-hand parsing.”
- began practicing his own coding techniques first on a TI-59 scientific calculator, at his nine-year-old: me too!
- extremely strong maths skill

## John Carmack

- *invsqrt* in Quake 3 Arena
