# my-cheatsheet

# Shell

- *openvt* to run a program on a new virtual console

# Emacs

- *C-x C-s* to save
- *C-x C-c* to exit
- *C-g* to quit a partially entered command
- *M-v and C-v* to move to the previous or next screen
- *C-p and C-n* to move to the previous or next line
- *C-b and C-f* to move to the previous or next character
- *M-b and M-f* to move to the previous or next word
- *C-a and C-e* to move to the beginning or end of a line
- *M-a and M-e* to move to the beginning or end of a sentence
- *M-< and M->* to move to the beginning or end of the whole text
- *C-u N something* repeat
- *C-d* to delete the next character
- *M-\<DEL> or M-d* to delete the previous or next word
- *C-<SPC>* to begin the mark set
- *C-w* to kill
- *C-y* to yank
- *C-/ or C-x u* to undo
- *C-x C-f* to find a file
- *C-x C-b* to list buffers
- *C-x b something* to switch buffer

# Framebuffer

See betteros.org/tut/graphics1.php

Thank you *prushik*!

```c
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
```

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
