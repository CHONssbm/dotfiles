const char *colorname[] = {

  /* 8 normal colors */
  [0] = "#0a0a07", /* black   */
  [1] = "#2d7b87", /* red     */
  [2] = "#388bab", /* green   */
  [3] = "#935f31", /* yellow  */
  [4] = "#c4974f", /* blue    */
  [5] = "#c99a5d", /* magenta */
  [6] = "#d1ac74", /* cyan    */
  [7] = "#c1c1c1", /* white   */

  /* 8 bright colors */
  [8]  = "#676754",  /* black   */
  [9]  = "#2d7b87",  /* red     */
  [10] = "#388bab", /* green   */
  [11] = "#935f31", /* yellow  */
  [12] = "#c4974f", /* blue    */
  [13] = "#c99a5d", /* magenta */
  [14] = "#d1ac74", /* cyan    */
  [15] = "#c1c1c1", /* white   */

  /* special colors */
  [256] = "#0a0a07", /* background */
  [257] = "#c1c1c1", /* foreground */
  [258] = "#c1c1c1",     /* cursor */
};

/* Default colors (colorname index)
 * foreground, background, cursor */
 unsigned int defaultbg = 0;
 unsigned int defaultfg = 257;
 unsigned int defaultcs = 258;
 unsigned int defaultrcs= 258;
