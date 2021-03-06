#define PAIR_BLOCKS 1000000
#define B_BLOCK_WIDTH 128
#define A_BLOCK_WIDTH 1024
#define EXTEND_GAP -2
#define START_GAP -2
#define MATCH 15
#define MISMATCH -3
#define WORKERS 72
#pragma OPENCL EXTENSION cl_intel_channels : enable
channel char           __attribute__((depth(1))) CHANNELA_W0;
channel char           __attribute__((depth(1))) CHANNELB_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W0;
channel char           __attribute__((depth(1))) CHANNELA_REV_W0;
channel char           __attribute__((depth(1))) CHANNELB_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W0;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W0;
channel char           __attribute__((depth(1))) CHANNELA_W1;
channel char           __attribute__((depth(1))) CHANNELB_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W1;
channel char           __attribute__((depth(1))) CHANNELA_REV_W1;
channel char           __attribute__((depth(1))) CHANNELB_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W1;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W1;
channel char           __attribute__((depth(1))) CHANNELA_W2;
channel char           __attribute__((depth(1))) CHANNELB_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W2;
channel char           __attribute__((depth(1))) CHANNELA_REV_W2;
channel char           __attribute__((depth(1))) CHANNELB_REV_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W2;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W2;
channel char           __attribute__((depth(1))) CHANNELA_W3;
channel char           __attribute__((depth(1))) CHANNELB_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W3;
channel char           __attribute__((depth(1))) CHANNELA_REV_W3;
channel char           __attribute__((depth(1))) CHANNELB_REV_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W3;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W3;
channel char           __attribute__((depth(1))) CHANNELA_W4;
channel char           __attribute__((depth(1))) CHANNELB_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W4;
channel char           __attribute__((depth(1))) CHANNELA_REV_W4;
channel char           __attribute__((depth(1))) CHANNELB_REV_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W4;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W4;
channel char           __attribute__((depth(1))) CHANNELA_W5;
channel char           __attribute__((depth(1))) CHANNELB_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W5;
channel char           __attribute__((depth(1))) CHANNELA_REV_W5;
channel char           __attribute__((depth(1))) CHANNELB_REV_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W5;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W5;
channel char           __attribute__((depth(1))) CHANNELA_W6;
channel char           __attribute__((depth(1))) CHANNELB_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W6;
channel char           __attribute__((depth(1))) CHANNELA_REV_W6;
channel char           __attribute__((depth(1))) CHANNELB_REV_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W6;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W6;
channel char           __attribute__((depth(1))) CHANNELA_W7;
channel char           __attribute__((depth(1))) CHANNELB_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W7;
channel char           __attribute__((depth(1))) CHANNELA_REV_W7;
channel char           __attribute__((depth(1))) CHANNELB_REV_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W7;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W7;
channel char           __attribute__((depth(1))) CHANNELA_W8;
channel char           __attribute__((depth(1))) CHANNELB_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W8;
channel char           __attribute__((depth(1))) CHANNELA_REV_W8;
channel char           __attribute__((depth(1))) CHANNELB_REV_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W8;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W8;
channel char           __attribute__((depth(1))) CHANNELA_W9;
channel char           __attribute__((depth(1))) CHANNELB_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W9;
channel char           __attribute__((depth(1))) CHANNELA_REV_W9;
channel char           __attribute__((depth(1))) CHANNELB_REV_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W9;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W9;
channel char           __attribute__((depth(1))) CHANNELA_W10;
channel char           __attribute__((depth(1))) CHANNELB_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W10;
channel char           __attribute__((depth(1))) CHANNELA_REV_W10;
channel char           __attribute__((depth(1))) CHANNELB_REV_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W10;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W10;
channel char           __attribute__((depth(1))) CHANNELA_W11;
channel char           __attribute__((depth(1))) CHANNELB_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W11;
channel char           __attribute__((depth(1))) CHANNELA_REV_W11;
channel char           __attribute__((depth(1))) CHANNELB_REV_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W11;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W11;
channel char           __attribute__((depth(1))) CHANNELA_W12;
channel char           __attribute__((depth(1))) CHANNELB_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W12;
channel char           __attribute__((depth(1))) CHANNELA_REV_W12;
channel char           __attribute__((depth(1))) CHANNELB_REV_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W12;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W12;
channel char           __attribute__((depth(1))) CHANNELA_W13;
channel char           __attribute__((depth(1))) CHANNELB_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W13;
channel char           __attribute__((depth(1))) CHANNELA_REV_W13;
channel char           __attribute__((depth(1))) CHANNELB_REV_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W13;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W13;
channel char           __attribute__((depth(1))) CHANNELA_W14;
channel char           __attribute__((depth(1))) CHANNELB_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W14;
channel char           __attribute__((depth(1))) CHANNELA_REV_W14;
channel char           __attribute__((depth(1))) CHANNELB_REV_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W14;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W14;
channel char           __attribute__((depth(1))) CHANNELA_W15;
channel char           __attribute__((depth(1))) CHANNELB_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W15;
channel char           __attribute__((depth(1))) CHANNELA_REV_W15;
channel char           __attribute__((depth(1))) CHANNELB_REV_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W15;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W15;
channel char           __attribute__((depth(1))) CHANNELA_W16;
channel char           __attribute__((depth(1))) CHANNELB_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W16;
channel char           __attribute__((depth(1))) CHANNELA_REV_W16;
channel char           __attribute__((depth(1))) CHANNELB_REV_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W16;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W16;
channel char           __attribute__((depth(1))) CHANNELA_W17;
channel char           __attribute__((depth(1))) CHANNELB_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W17;
channel char           __attribute__((depth(1))) CHANNELA_REV_W17;
channel char           __attribute__((depth(1))) CHANNELB_REV_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W17;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W17;
channel char           __attribute__((depth(1))) CHANNELA_W18;
channel char           __attribute__((depth(1))) CHANNELB_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W18;
channel char           __attribute__((depth(1))) CHANNELA_REV_W18;
channel char           __attribute__((depth(1))) CHANNELB_REV_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W18;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W18;
channel char           __attribute__((depth(1))) CHANNELA_W19;
channel char           __attribute__((depth(1))) CHANNELB_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W19;
channel char           __attribute__((depth(1))) CHANNELA_REV_W19;
channel char           __attribute__((depth(1))) CHANNELB_REV_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W19;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W19;
channel char           __attribute__((depth(1))) CHANNELA_W20;
channel char           __attribute__((depth(1))) CHANNELB_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W20;
channel char           __attribute__((depth(1))) CHANNELA_REV_W20;
channel char           __attribute__((depth(1))) CHANNELB_REV_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W20;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W20;
channel char           __attribute__((depth(1))) CHANNELA_W21;
channel char           __attribute__((depth(1))) CHANNELB_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W21;
channel char           __attribute__((depth(1))) CHANNELA_REV_W21;
channel char           __attribute__((depth(1))) CHANNELB_REV_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W21;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W21;
channel char           __attribute__((depth(1))) CHANNELA_W22;
channel char           __attribute__((depth(1))) CHANNELB_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W22;
channel char           __attribute__((depth(1))) CHANNELA_REV_W22;
channel char           __attribute__((depth(1))) CHANNELB_REV_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W22;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W22;
channel char           __attribute__((depth(1))) CHANNELA_W23;
channel char           __attribute__((depth(1))) CHANNELB_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W23;
channel char           __attribute__((depth(1))) CHANNELA_REV_W23;
channel char           __attribute__((depth(1))) CHANNELB_REV_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W23;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W23;
channel char           __attribute__((depth(1))) CHANNELA_W24;
channel char           __attribute__((depth(1))) CHANNELB_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W24;
channel char           __attribute__((depth(1))) CHANNELA_REV_W24;
channel char           __attribute__((depth(1))) CHANNELB_REV_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W24;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W24;
channel char           __attribute__((depth(1))) CHANNELA_W25;
channel char           __attribute__((depth(1))) CHANNELB_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W25;
channel char           __attribute__((depth(1))) CHANNELA_REV_W25;
channel char           __attribute__((depth(1))) CHANNELB_REV_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W25;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W25;
channel char           __attribute__((depth(1))) CHANNELA_W26;
channel char           __attribute__((depth(1))) CHANNELB_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W26;
channel char           __attribute__((depth(1))) CHANNELA_REV_W26;
channel char           __attribute__((depth(1))) CHANNELB_REV_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W26;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W26;
channel char           __attribute__((depth(1))) CHANNELA_W27;
channel char           __attribute__((depth(1))) CHANNELB_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W27;
channel char           __attribute__((depth(1))) CHANNELA_REV_W27;
channel char           __attribute__((depth(1))) CHANNELB_REV_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W27;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W27;
channel char           __attribute__((depth(1))) CHANNELA_W28;
channel char           __attribute__((depth(1))) CHANNELB_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W28;
channel char           __attribute__((depth(1))) CHANNELA_REV_W28;
channel char           __attribute__((depth(1))) CHANNELB_REV_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W28;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W28;
channel char           __attribute__((depth(1))) CHANNELA_W29;
channel char           __attribute__((depth(1))) CHANNELB_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W29;
channel char           __attribute__((depth(1))) CHANNELA_REV_W29;
channel char           __attribute__((depth(1))) CHANNELB_REV_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W29;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W29;
channel char           __attribute__((depth(1))) CHANNELA_W30;
channel char           __attribute__((depth(1))) CHANNELB_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W30;
channel char           __attribute__((depth(1))) CHANNELA_REV_W30;
channel char           __attribute__((depth(1))) CHANNELB_REV_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W30;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W30;
channel char           __attribute__((depth(1))) CHANNELA_W31;
channel char           __attribute__((depth(1))) CHANNELB_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W31;
channel char           __attribute__((depth(1))) CHANNELA_REV_W31;
channel char           __attribute__((depth(1))) CHANNELB_REV_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W31;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W31;
channel char           __attribute__((depth(1))) CHANNELA_W32;
channel char           __attribute__((depth(1))) CHANNELB_W32;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W32;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W32;
channel char           __attribute__((depth(1))) CHANNELA_REV_W32;
channel char           __attribute__((depth(1))) CHANNELB_REV_W32;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W32;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W32;
channel char           __attribute__((depth(1))) CHANNELA_W33;
channel char           __attribute__((depth(1))) CHANNELB_W33;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W33;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W33;
channel char           __attribute__((depth(1))) CHANNELA_REV_W33;
channel char           __attribute__((depth(1))) CHANNELB_REV_W33;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W33;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W33;
channel char           __attribute__((depth(1))) CHANNELA_W34;
channel char           __attribute__((depth(1))) CHANNELB_W34;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W34;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W34;
channel char           __attribute__((depth(1))) CHANNELA_REV_W34;
channel char           __attribute__((depth(1))) CHANNELB_REV_W34;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W34;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W34;
channel char           __attribute__((depth(1))) CHANNELA_W35;
channel char           __attribute__((depth(1))) CHANNELB_W35;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W35;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W35;
channel char           __attribute__((depth(1))) CHANNELA_REV_W35;
channel char           __attribute__((depth(1))) CHANNELB_REV_W35;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W35;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W35;
channel char           __attribute__((depth(1))) CHANNELA_W36;
channel char           __attribute__((depth(1))) CHANNELB_W36;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W36;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W36;
channel char           __attribute__((depth(1))) CHANNELA_REV_W36;
channel char           __attribute__((depth(1))) CHANNELB_REV_W36;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W36;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W36;
channel char           __attribute__((depth(1))) CHANNELA_W37;
channel char           __attribute__((depth(1))) CHANNELB_W37;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W37;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W37;
channel char           __attribute__((depth(1))) CHANNELA_REV_W37;
channel char           __attribute__((depth(1))) CHANNELB_REV_W37;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W37;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W37;
channel char           __attribute__((depth(1))) CHANNELA_W38;
channel char           __attribute__((depth(1))) CHANNELB_W38;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W38;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W38;
channel char           __attribute__((depth(1))) CHANNELA_REV_W38;
channel char           __attribute__((depth(1))) CHANNELB_REV_W38;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W38;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W38;
channel char           __attribute__((depth(1))) CHANNELA_W39;
channel char           __attribute__((depth(1))) CHANNELB_W39;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W39;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W39;
channel char           __attribute__((depth(1))) CHANNELA_REV_W39;
channel char           __attribute__((depth(1))) CHANNELB_REV_W39;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W39;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W39;
channel char           __attribute__((depth(1))) CHANNELA_W40;
channel char           __attribute__((depth(1))) CHANNELB_W40;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W40;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W40;
channel char           __attribute__((depth(1))) CHANNELA_REV_W40;
channel char           __attribute__((depth(1))) CHANNELB_REV_W40;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W40;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W40;
channel char           __attribute__((depth(1))) CHANNELA_W41;
channel char           __attribute__((depth(1))) CHANNELB_W41;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W41;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W41;
channel char           __attribute__((depth(1))) CHANNELA_REV_W41;
channel char           __attribute__((depth(1))) CHANNELB_REV_W41;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W41;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W41;
channel char           __attribute__((depth(1))) CHANNELA_W42;
channel char           __attribute__((depth(1))) CHANNELB_W42;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W42;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W42;
channel char           __attribute__((depth(1))) CHANNELA_REV_W42;
channel char           __attribute__((depth(1))) CHANNELB_REV_W42;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W42;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W42;
channel char           __attribute__((depth(1))) CHANNELA_W43;
channel char           __attribute__((depth(1))) CHANNELB_W43;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W43;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W43;
channel char           __attribute__((depth(1))) CHANNELA_REV_W43;
channel char           __attribute__((depth(1))) CHANNELB_REV_W43;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W43;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W43;
channel char           __attribute__((depth(1))) CHANNELA_W44;
channel char           __attribute__((depth(1))) CHANNELB_W44;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W44;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W44;
channel char           __attribute__((depth(1))) CHANNELA_REV_W44;
channel char           __attribute__((depth(1))) CHANNELB_REV_W44;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W44;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W44;
channel char           __attribute__((depth(1))) CHANNELA_W45;
channel char           __attribute__((depth(1))) CHANNELB_W45;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W45;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W45;
channel char           __attribute__((depth(1))) CHANNELA_REV_W45;
channel char           __attribute__((depth(1))) CHANNELB_REV_W45;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W45;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W45;
channel char           __attribute__((depth(1))) CHANNELA_W46;
channel char           __attribute__((depth(1))) CHANNELB_W46;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W46;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W46;
channel char           __attribute__((depth(1))) CHANNELA_REV_W46;
channel char           __attribute__((depth(1))) CHANNELB_REV_W46;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W46;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W46;
channel char           __attribute__((depth(1))) CHANNELA_W47;
channel char           __attribute__((depth(1))) CHANNELB_W47;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W47;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W47;
channel char           __attribute__((depth(1))) CHANNELA_REV_W47;
channel char           __attribute__((depth(1))) CHANNELB_REV_W47;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W47;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W47;
channel char           __attribute__((depth(1))) CHANNELA_W48;
channel char           __attribute__((depth(1))) CHANNELB_W48;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W48;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W48;
channel char           __attribute__((depth(1))) CHANNELA_REV_W48;
channel char           __attribute__((depth(1))) CHANNELB_REV_W48;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W48;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W48;
channel char           __attribute__((depth(1))) CHANNELA_W49;
channel char           __attribute__((depth(1))) CHANNELB_W49;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W49;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W49;
channel char           __attribute__((depth(1))) CHANNELA_REV_W49;
channel char           __attribute__((depth(1))) CHANNELB_REV_W49;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W49;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W49;
channel char           __attribute__((depth(1))) CHANNELA_W50;
channel char           __attribute__((depth(1))) CHANNELB_W50;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W50;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W50;
channel char           __attribute__((depth(1))) CHANNELA_REV_W50;
channel char           __attribute__((depth(1))) CHANNELB_REV_W50;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W50;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W50;
channel char           __attribute__((depth(1))) CHANNELA_W51;
channel char           __attribute__((depth(1))) CHANNELB_W51;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W51;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W51;
channel char           __attribute__((depth(1))) CHANNELA_REV_W51;
channel char           __attribute__((depth(1))) CHANNELB_REV_W51;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W51;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W51;
channel char           __attribute__((depth(1))) CHANNELA_W52;
channel char           __attribute__((depth(1))) CHANNELB_W52;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W52;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W52;
channel char           __attribute__((depth(1))) CHANNELA_REV_W52;
channel char           __attribute__((depth(1))) CHANNELB_REV_W52;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W52;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W52;
channel char           __attribute__((depth(1))) CHANNELA_W53;
channel char           __attribute__((depth(1))) CHANNELB_W53;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W53;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W53;
channel char           __attribute__((depth(1))) CHANNELA_REV_W53;
channel char           __attribute__((depth(1))) CHANNELB_REV_W53;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W53;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W53;
channel char           __attribute__((depth(1))) CHANNELA_W54;
channel char           __attribute__((depth(1))) CHANNELB_W54;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W54;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W54;
channel char           __attribute__((depth(1))) CHANNELA_REV_W54;
channel char           __attribute__((depth(1))) CHANNELB_REV_W54;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W54;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W54;
channel char           __attribute__((depth(1))) CHANNELA_W55;
channel char           __attribute__((depth(1))) CHANNELB_W55;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W55;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W55;
channel char           __attribute__((depth(1))) CHANNELA_REV_W55;
channel char           __attribute__((depth(1))) CHANNELB_REV_W55;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W55;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W55;
channel char           __attribute__((depth(1))) CHANNELA_W56;
channel char           __attribute__((depth(1))) CHANNELB_W56;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W56;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W56;
channel char           __attribute__((depth(1))) CHANNELA_REV_W56;
channel char           __attribute__((depth(1))) CHANNELB_REV_W56;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W56;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W56;
channel char           __attribute__((depth(1))) CHANNELA_W57;
channel char           __attribute__((depth(1))) CHANNELB_W57;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W57;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W57;
channel char           __attribute__((depth(1))) CHANNELA_REV_W57;
channel char           __attribute__((depth(1))) CHANNELB_REV_W57;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W57;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W57;
channel char           __attribute__((depth(1))) CHANNELA_W58;
channel char           __attribute__((depth(1))) CHANNELB_W58;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W58;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W58;
channel char           __attribute__((depth(1))) CHANNELA_REV_W58;
channel char           __attribute__((depth(1))) CHANNELB_REV_W58;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W58;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W58;
channel char           __attribute__((depth(1))) CHANNELA_W59;
channel char           __attribute__((depth(1))) CHANNELB_W59;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W59;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W59;
channel char           __attribute__((depth(1))) CHANNELA_REV_W59;
channel char           __attribute__((depth(1))) CHANNELB_REV_W59;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W59;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W59;
channel char           __attribute__((depth(1))) CHANNELA_W60;
channel char           __attribute__((depth(1))) CHANNELB_W60;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W60;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W60;
channel char           __attribute__((depth(1))) CHANNELA_REV_W60;
channel char           __attribute__((depth(1))) CHANNELB_REV_W60;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W60;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W60;
channel char           __attribute__((depth(1))) CHANNELA_W61;
channel char           __attribute__((depth(1))) CHANNELB_W61;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W61;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W61;
channel char           __attribute__((depth(1))) CHANNELA_REV_W61;
channel char           __attribute__((depth(1))) CHANNELB_REV_W61;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W61;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W61;
channel char           __attribute__((depth(1))) CHANNELA_W62;
channel char           __attribute__((depth(1))) CHANNELB_W62;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W62;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W62;
channel char           __attribute__((depth(1))) CHANNELA_REV_W62;
channel char           __attribute__((depth(1))) CHANNELB_REV_W62;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W62;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W62;
channel char           __attribute__((depth(1))) CHANNELA_W63;
channel char           __attribute__((depth(1))) CHANNELB_W63;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W63;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W63;
channel char           __attribute__((depth(1))) CHANNELA_REV_W63;
channel char           __attribute__((depth(1))) CHANNELB_REV_W63;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W63;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W63;
channel char           __attribute__((depth(1))) CHANNELA_W64;
channel char           __attribute__((depth(1))) CHANNELB_W64;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W64;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W64;
channel char           __attribute__((depth(1))) CHANNELA_REV_W64;
channel char           __attribute__((depth(1))) CHANNELB_REV_W64;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W64;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W64;
channel char           __attribute__((depth(1))) CHANNELA_W65;
channel char           __attribute__((depth(1))) CHANNELB_W65;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W65;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W65;
channel char           __attribute__((depth(1))) CHANNELA_REV_W65;
channel char           __attribute__((depth(1))) CHANNELB_REV_W65;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W65;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W65;
channel char           __attribute__((depth(1))) CHANNELA_W66;
channel char           __attribute__((depth(1))) CHANNELB_W66;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W66;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W66;
channel char           __attribute__((depth(1))) CHANNELA_REV_W66;
channel char           __attribute__((depth(1))) CHANNELB_REV_W66;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W66;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W66;
channel char           __attribute__((depth(1))) CHANNELA_W67;
channel char           __attribute__((depth(1))) CHANNELB_W67;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W67;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W67;
channel char           __attribute__((depth(1))) CHANNELA_REV_W67;
channel char           __attribute__((depth(1))) CHANNELB_REV_W67;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W67;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W67;
channel char           __attribute__((depth(1))) CHANNELA_W68;
channel char           __attribute__((depth(1))) CHANNELB_W68;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W68;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W68;
channel char           __attribute__((depth(1))) CHANNELA_REV_W68;
channel char           __attribute__((depth(1))) CHANNELB_REV_W68;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W68;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W68;
channel char           __attribute__((depth(1))) CHANNELA_W69;
channel char           __attribute__((depth(1))) CHANNELB_W69;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W69;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W69;
channel char           __attribute__((depth(1))) CHANNELA_REV_W69;
channel char           __attribute__((depth(1))) CHANNELB_REV_W69;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W69;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W69;
channel char           __attribute__((depth(1))) CHANNELA_W70;
channel char           __attribute__((depth(1))) CHANNELB_W70;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W70;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W70;
channel char           __attribute__((depth(1))) CHANNELA_REV_W70;
channel char           __attribute__((depth(1))) CHANNELB_REV_W70;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W70;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W70;
channel char           __attribute__((depth(1))) CHANNELA_W71;
channel char           __attribute__((depth(1))) CHANNELB_W71;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_W71;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_W71;
channel char           __attribute__((depth(1))) CHANNELA_REV_W71;
channel char           __attribute__((depth(1))) CHANNELB_REV_W71;
channel unsigned short __attribute__((depth(1))) CHANNEL_ROWIDX_REV_W71;
channel unsigned short __attribute__((depth(1))) CHANNEL_COLIDX_REV_W71;
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB0(__global char * restrict a, __global char * restrict b, 
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
    __local char private_b[B_BLOCK_WIDTH];
    __local char ai;
    __local char ai_rev;
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w+=3)
        {
            __global char * volatile ptr_b; //declare with volatile so that the compiler will not waste area for caching loaded data 
            unsigned seqA_idx, seqB_idx;
            if(pair==0 && w==0){ seqA_idx= 0; seqB_idx= 0;}
            else{ seqA_idx     = prefix_lengthA[pair + w - 1]; seqB_idx= prefix_lengthB[pair + w - 1];}
            ptr_a[w] = &a[seqA_idx];
            ptr_b = &b[seqB_idx];
            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
              case 0:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W0, private_b[offset]);
                  }
                  break;
              case 3:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W3, private_b[offset]);
                  }
                  break;
              case 6:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W6, private_b[offset]);
                  }
                  break;
              case 9:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W9, private_b[offset]);
                  }
                  break;
              case 12:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W12, private_b[offset]);
                  }
                  break;
              case 15:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W15, private_b[offset]);
                  }
                  break;
              case 18:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W18, private_b[offset]);
                  }
                  break;
              case 21:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W21, private_b[offset]);
                  }
                  break;
              case 24:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W24, private_b[offset]);
                  }
                  break;
              case 27:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W27, private_b[offset]);
                  }
                  break;
              case 30:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W30, private_b[offset]);
                  }
                  break;
              case 33:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W33, private_b[offset]);
                  }
                  break;
              case 36:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W36, private_b[offset]);
                  }
                  break;
              case 39:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W39, private_b[offset]);
                  }
                  break;
              case 42:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W42, private_b[offset]);
                  }
                  break;
              case 45:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W45, private_b[offset]);
                  }
                  break;
              case 48:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W48, private_b[offset]);
                  }
                  break;
              case 51:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W51, private_b[offset]);
                  }
                  break;
              case 54:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W54, private_b[offset]);
                  }
                  break;
              case 57:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W57, private_b[offset]);
                  }
                  break;
              case 60:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W60, private_b[offset]);
                  }
                  break;
              case 63:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W63, private_b[offset]);
                  }
                  break;
              case 66:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W66, private_b[offset]);
                  }
                  break;
              case 69:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W69, private_b[offset]);
                  }
                  break;
            }//end switch
        }//end for workers
        unsigned short i_rev=A_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            #pragma unroll 1
            for(unsigned short w=0; w<WORKERS; w+=3)
            {
                ai     = ptr_a[w][i];
                ai_rev     = ptr_a[w][i_rev];
                switch(w){
                    case 0:
                        write_channel_intel(CHANNELA_W0, ai);
                        write_channel_intel(CHANNELA_REV_W0, ai_rev);
                    break;
                    case 3:
                        write_channel_intel(CHANNELA_W3, ai);
                        write_channel_intel(CHANNELA_REV_W3, ai_rev);
                    break;
                    case 6:
                        write_channel_intel(CHANNELA_W6, ai);
                        write_channel_intel(CHANNELA_REV_W6, ai_rev);
                    break;
                    case 9:
                        write_channel_intel(CHANNELA_W9, ai);
                        write_channel_intel(CHANNELA_REV_W9, ai_rev);
                    break;
                    case 12:
                        write_channel_intel(CHANNELA_W12, ai);
                        write_channel_intel(CHANNELA_REV_W12, ai_rev);
                    break;
                    case 15:
                        write_channel_intel(CHANNELA_W15, ai);
                        write_channel_intel(CHANNELA_REV_W15, ai_rev);
                    break;
                    case 18:
                        write_channel_intel(CHANNELA_W18, ai);
                        write_channel_intel(CHANNELA_REV_W18, ai_rev);
                    break;
                    case 21:
                        write_channel_intel(CHANNELA_W21, ai);
                        write_channel_intel(CHANNELA_REV_W21, ai_rev);
                    break;
                    case 24:
                        write_channel_intel(CHANNELA_W24, ai);
                        write_channel_intel(CHANNELA_REV_W24, ai_rev);
                    break;
                    case 27:
                        write_channel_intel(CHANNELA_W27, ai);
                        write_channel_intel(CHANNELA_REV_W27, ai_rev);
                    break;
                    case 30:
                        write_channel_intel(CHANNELA_W30, ai);
                        write_channel_intel(CHANNELA_REV_W30, ai_rev);
                    break;
                    case 33:
                        write_channel_intel(CHANNELA_W33, ai);
                        write_channel_intel(CHANNELA_REV_W33, ai_rev);
                    break;
                    case 36:
                        write_channel_intel(CHANNELA_W36, ai);
                        write_channel_intel(CHANNELA_REV_W36, ai_rev);
                    break;
                    case 39:
                        write_channel_intel(CHANNELA_W39, ai);
                        write_channel_intel(CHANNELA_REV_W39, ai_rev);
                    break;
                    case 42:
                        write_channel_intel(CHANNELA_W42, ai);
                        write_channel_intel(CHANNELA_REV_W42, ai_rev);
                    break;
                    case 45:
                        write_channel_intel(CHANNELA_W45, ai);
                        write_channel_intel(CHANNELA_REV_W45, ai_rev);
                    break;
                    case 48:
                        write_channel_intel(CHANNELA_W48, ai);
                        write_channel_intel(CHANNELA_REV_W48, ai_rev);
                    break;
                    case 51:
                        write_channel_intel(CHANNELA_W51, ai);
                        write_channel_intel(CHANNELA_REV_W51, ai_rev);
                    break;
                    case 54:
                        write_channel_intel(CHANNELA_W54, ai);
                        write_channel_intel(CHANNELA_REV_W54, ai_rev);
                    break;
                    case 57:
                        write_channel_intel(CHANNELA_W57, ai);
                        write_channel_intel(CHANNELA_REV_W57, ai_rev);
                    break;
                    case 60:
                        write_channel_intel(CHANNELA_W60, ai);
                        write_channel_intel(CHANNELA_REV_W60, ai_rev);
                    break;
                    case 63:
                        write_channel_intel(CHANNELA_W63, ai);
                        write_channel_intel(CHANNELA_REV_W63, ai_rev);
                    break;
                    case 66:
                        write_channel_intel(CHANNELA_W66, ai);
                        write_channel_intel(CHANNELA_REV_W66, ai_rev);
                    break;
                    case 69:
                        write_channel_intel(CHANNELA_W69, ai);
                        write_channel_intel(CHANNELA_REV_W69, ai_rev);
                    break;
                }//end switch
            }//end worker
            i_rev= i_rev-1;
        }//end A rows
    }//end pair
}//end loadAB function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB1(__global char * restrict a, __global char * restrict b, 
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
    __local char private_b[B_BLOCK_WIDTH];
    __local char ai;
    __local char ai_rev;
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=1; w<WORKERS; w+=3)
        {
            __global char * volatile ptr_b; //declare with volatile so that the compiler will not waste area for caching loaded data 
            unsigned seqA_idx, seqB_idx;
            seqA_idx     = prefix_lengthA[pair + w - 1];
            seqB_idx     = prefix_lengthB[pair + w - 1];
            ptr_a[w] = &a[seqA_idx];
            ptr_b = &b[seqB_idx];
            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
              case 1:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W1, private_b[offset]);
                  }
                  break;
              case 4:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W4, private_b[offset]);
                  }
                  break;
              case 7:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W7, private_b[offset]);
                  }
                  break;
              case 10:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W10, private_b[offset]);
                  }
                  break;
              case 13:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W13, private_b[offset]);
                  }
                  break;
              case 16:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W16, private_b[offset]);
                  }
                  break;
              case 19:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W19, private_b[offset]);
                  }
                  break;
              case 22:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W22, private_b[offset]);
                  }
                  break;
              case 25:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W25, private_b[offset]);
                  }
                  break;
              case 28:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W28, private_b[offset]);
                  }
                  break;
              case 31:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W31, private_b[offset]);
                  }
                  break;
              case 34:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W34, private_b[offset]);
                  }
                  break;
              case 37:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W37, private_b[offset]);
                  }
                  break;
              case 40:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W40, private_b[offset]);
                  }
                  break;
              case 43:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W43, private_b[offset]);
                  }
                  break;
              case 46:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W46, private_b[offset]);
                  }
                  break;
              case 49:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W49, private_b[offset]);
                  }
                  break;
              case 52:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W52, private_b[offset]);
                  }
                  break;
              case 55:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W55, private_b[offset]);
                  }
                  break;
              case 58:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W58, private_b[offset]);
                  }
                  break;
              case 61:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W61, private_b[offset]);
                  }
                  break;
              case 64:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W64, private_b[offset]);
                  }
                  break;
              case 67:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W67, private_b[offset]);
                  }
                  break;
              case 70:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W70, private_b[offset]);
                  }
                  break;
            }//end switch
        }//end for workers
        unsigned short i_rev=A_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            #pragma unroll 1
            for(unsigned short w=1; w<WORKERS; w+=3)
            {
                ai     = ptr_a[w][i];
                ai_rev     = ptr_a[w][i_rev];
                switch(w){
                    case 1:
                        write_channel_intel(CHANNELA_W1, ai);
                        write_channel_intel(CHANNELA_REV_W1, ai_rev);
                    break;
                    case 4:
                        write_channel_intel(CHANNELA_W4, ai);
                        write_channel_intel(CHANNELA_REV_W4, ai_rev);
                    break;
                    case 7:
                        write_channel_intel(CHANNELA_W7, ai);
                        write_channel_intel(CHANNELA_REV_W7, ai_rev);
                    break;
                    case 10:
                        write_channel_intel(CHANNELA_W10, ai);
                        write_channel_intel(CHANNELA_REV_W10, ai_rev);
                    break;
                    case 13:
                        write_channel_intel(CHANNELA_W13, ai);
                        write_channel_intel(CHANNELA_REV_W13, ai_rev);
                    break;
                    case 16:
                        write_channel_intel(CHANNELA_W16, ai);
                        write_channel_intel(CHANNELA_REV_W16, ai_rev);
                    break;
                    case 19:
                        write_channel_intel(CHANNELA_W19, ai);
                        write_channel_intel(CHANNELA_REV_W19, ai_rev);
                    break;
                    case 22:
                        write_channel_intel(CHANNELA_W22, ai);
                        write_channel_intel(CHANNELA_REV_W22, ai_rev);
                    break;
                    case 25:
                        write_channel_intel(CHANNELA_W25, ai);
                        write_channel_intel(CHANNELA_REV_W25, ai_rev);
                    break;
                    case 28:
                        write_channel_intel(CHANNELA_W28, ai);
                        write_channel_intel(CHANNELA_REV_W28, ai_rev);
                    break;
                    case 31:
                        write_channel_intel(CHANNELA_W31, ai);
                        write_channel_intel(CHANNELA_REV_W31, ai_rev);
                    break;
                    case 34:
                        write_channel_intel(CHANNELA_W34, ai);
                        write_channel_intel(CHANNELA_REV_W34, ai_rev);
                    break;
                    case 37:
                        write_channel_intel(CHANNELA_W37, ai);
                        write_channel_intel(CHANNELA_REV_W37, ai_rev);
                    break;
                    case 40:
                        write_channel_intel(CHANNELA_W40, ai);
                        write_channel_intel(CHANNELA_REV_W40, ai_rev);
                    break;
                    case 43:
                        write_channel_intel(CHANNELA_W43, ai);
                        write_channel_intel(CHANNELA_REV_W43, ai_rev);
                    break;
                    case 46:
                        write_channel_intel(CHANNELA_W46, ai);
                        write_channel_intel(CHANNELA_REV_W46, ai_rev);
                    break;
                    case 49:
                        write_channel_intel(CHANNELA_W49, ai);
                        write_channel_intel(CHANNELA_REV_W49, ai_rev);
                    break;
                    case 52:
                        write_channel_intel(CHANNELA_W52, ai);
                        write_channel_intel(CHANNELA_REV_W52, ai_rev);
                    break;
                    case 55:
                        write_channel_intel(CHANNELA_W55, ai);
                        write_channel_intel(CHANNELA_REV_W55, ai_rev);
                    break;
                    case 58:
                        write_channel_intel(CHANNELA_W58, ai);
                        write_channel_intel(CHANNELA_REV_W58, ai_rev);
                    break;
                    case 61:
                        write_channel_intel(CHANNELA_W61, ai);
                        write_channel_intel(CHANNELA_REV_W61, ai_rev);
                    break;
                    case 64:
                        write_channel_intel(CHANNELA_W64, ai);
                        write_channel_intel(CHANNELA_REV_W64, ai_rev);
                    break;
                    case 67:
                        write_channel_intel(CHANNELA_W67, ai);
                        write_channel_intel(CHANNELA_REV_W67, ai_rev);
                    break;
                    case 70:
                        write_channel_intel(CHANNELA_W70, ai);
                        write_channel_intel(CHANNELA_REV_W70, ai_rev);
                    break;
                }//end switch
            }//end worker
            i_rev= i_rev-1;
        }//end A rows
    }//end pair
}//end loadAB function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void loadAB2(__global char * restrict a, __global char * restrict b, 
        __global const unsigned * restrict prefix_lengthA,
        __global const unsigned * restrict prefix_lengthB)
{
    __local char private_b[B_BLOCK_WIDTH];
    __local char ai;
    __local char ai_rev;
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        __global char* volatile ptr_a[WORKERS];
        #pragma unroll 1
        for(unsigned short w=2; w<WORKERS; w+=3)
        {
            __global char * volatile ptr_b; //declare with volatile so that the compiler will not waste area for caching loaded data 
            unsigned seqA_idx, seqB_idx;
            seqA_idx     = prefix_lengthA[pair + w - 1];
            seqB_idx     = prefix_lengthB[pair + w - 1];
            ptr_a[w] = &a[seqA_idx];
            ptr_b = &b[seqB_idx];
            #pragma unroll 1
            #pragma ivdep
            for (unsigned short j=0; j < B_BLOCK_WIDTH ; j++)
            {
                private_b[j] = ptr_b[j];
            }
            switch(w){
              case 2:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W2, private_b[offset]);
                  }
                  break;
              case 5:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W5, private_b[offset]);
                  }
                  break;
              case 8:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W8, private_b[offset]);
                  }
                  break;
              case 11:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W11, private_b[offset]);
                  }
                  break;
              case 14:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W14, private_b[offset]);
                  }
                  break;
              case 17:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W17, private_b[offset]);
                  }
                  break;
              case 20:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W20, private_b[offset]);
                  }
                  break;
              case 23:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W23, private_b[offset]);
                  }
                  break;
              case 26:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W26, private_b[offset]);
                  }
                  break;
              case 29:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W29, private_b[offset]);
                  }
                  break;
              case 32:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W32, private_b[offset]);
                  }
                  break;
              case 35:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W35, private_b[offset]);
                  }
                  break;
              case 38:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W38, private_b[offset]);
                  }
                  break;
              case 41:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W41, private_b[offset]);
                  }
                  break;
              case 44:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W44, private_b[offset]);
                  }
                  break;
              case 47:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W47, private_b[offset]);
                  }
                  break;
              case 50:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W50, private_b[offset]);
                  }
                  break;
              case 53:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W53, private_b[offset]);
                  }
                  break;
              case 56:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W56, private_b[offset]);
                  }
                  break;
              case 59:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W59, private_b[offset]);
                  }
                  break;
              case 62:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W62, private_b[offset]);
                  }
                  break;
              case 65:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W65, private_b[offset]);
                  }
                  break;
              case 68:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W68, private_b[offset]);
                  }
                  break;
              case 71:
                  for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
                  {
                      write_channel_intel(CHANNELB_W71, private_b[offset]);
                  }
                  break;
            }//end switch
        }//end for workers
        unsigned short i_rev=A_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            #pragma unroll 1
            for(unsigned short w=2; w<WORKERS; w+=3)
            {
                ai     = ptr_a[w][i];
                ai_rev     = ptr_a[w][i_rev];
                switch(w){
                    case 2:
                        write_channel_intel(CHANNELA_W2, ai);
                        write_channel_intel(CHANNELA_REV_W2, ai_rev);
                    break;
                    case 5:
                        write_channel_intel(CHANNELA_W5, ai);
                        write_channel_intel(CHANNELA_REV_W5, ai_rev);
                    break;
                    case 8:
                        write_channel_intel(CHANNELA_W8, ai);
                        write_channel_intel(CHANNELA_REV_W8, ai_rev);
                    break;
                    case 11:
                        write_channel_intel(CHANNELA_W11, ai);
                        write_channel_intel(CHANNELA_REV_W11, ai_rev);
                    break;
                    case 14:
                        write_channel_intel(CHANNELA_W14, ai);
                        write_channel_intel(CHANNELA_REV_W14, ai_rev);
                    break;
                    case 17:
                        write_channel_intel(CHANNELA_W17, ai);
                        write_channel_intel(CHANNELA_REV_W17, ai_rev);
                    break;
                    case 20:
                        write_channel_intel(CHANNELA_W20, ai);
                        write_channel_intel(CHANNELA_REV_W20, ai_rev);
                    break;
                    case 23:
                        write_channel_intel(CHANNELA_W23, ai);
                        write_channel_intel(CHANNELA_REV_W23, ai_rev);
                    break;
                    case 26:
                        write_channel_intel(CHANNELA_W26, ai);
                        write_channel_intel(CHANNELA_REV_W26, ai_rev);
                    break;
                    case 29:
                        write_channel_intel(CHANNELA_W29, ai);
                        write_channel_intel(CHANNELA_REV_W29, ai_rev);
                    break;
                    case 32:
                        write_channel_intel(CHANNELA_W32, ai);
                        write_channel_intel(CHANNELA_REV_W32, ai_rev);
                    break;
                    case 35:
                        write_channel_intel(CHANNELA_W35, ai);
                        write_channel_intel(CHANNELA_REV_W35, ai_rev);
                    break;
                    case 38:
                        write_channel_intel(CHANNELA_W38, ai);
                        write_channel_intel(CHANNELA_REV_W38, ai_rev);
                    break;
                    case 41:
                        write_channel_intel(CHANNELA_W41, ai);
                        write_channel_intel(CHANNELA_REV_W41, ai_rev);
                    break;
                    case 44:
                        write_channel_intel(CHANNELA_W44, ai);
                        write_channel_intel(CHANNELA_REV_W44, ai_rev);
                    break;
                    case 47:
                        write_channel_intel(CHANNELA_W47, ai);
                        write_channel_intel(CHANNELA_REV_W47, ai_rev);
                    break;
                    case 50:
                        write_channel_intel(CHANNELA_W50, ai);
                        write_channel_intel(CHANNELA_REV_W50, ai_rev);
                    break;
                    case 53:
                        write_channel_intel(CHANNELA_W53, ai);
                        write_channel_intel(CHANNELA_REV_W53, ai_rev);
                    break;
                    case 56:
                        write_channel_intel(CHANNELA_W56, ai);
                        write_channel_intel(CHANNELA_REV_W56, ai_rev);
                    break;
                    case 59:
                        write_channel_intel(CHANNELA_W59, ai);
                        write_channel_intel(CHANNELA_REV_W59, ai_rev);
                    break;
                    case 62:
                        write_channel_intel(CHANNELA_W62, ai);
                        write_channel_intel(CHANNELA_REV_W62, ai_rev);
                    break;
                    case 65:
                        write_channel_intel(CHANNELA_W65, ai);
                        write_channel_intel(CHANNELA_REV_W65, ai_rev);
                    break;
                    case 68:
                        write_channel_intel(CHANNELA_W68, ai);
                        write_channel_intel(CHANNELA_REV_W68, ai_rev);
                    break;
                    case 71:
                        write_channel_intel(CHANNELA_W71, ai);
                        write_channel_intel(CHANNELA_REV_W71, ai_rev);
                    break;
                }//end switch
            }//end worker
            i_rev= i_rev-1;
        }//end A rows
    }//end pair
}//end loadAB function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void storeResults (
__global unsigned short* restrict seqA_align_beg, __global unsigned short* restrict seqA_align_end,
__global unsigned short* restrict seqB_align_beg, __global unsigned short* restrict seqB_align_end)
{
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        unsigned short row_idx[WORKERS], finalColIdx[WORKERS], row_idx_rev[WORKERS], finalColIdx_rev[WORKERS];
        for(unsigned short w=0; w<WORKERS; w++)
        {
            switch(w){
                case 0:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W0);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W0);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W0);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W0);
                    break;
                case 1:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W1);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W1);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W1);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W1);
                    break;
                case 2:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W2);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W2);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W2);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W2);
                    break;
                case 3:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W3);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W3);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W3);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W3);
                    break;
                case 4:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W4);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W4);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W4);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W4);
                    break;
                case 5:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W5);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W5);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W5);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W5);
                    break;
                case 6:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W6);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W6);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W6);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W6);
                    break;
                case 7:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W7);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W7);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W7);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W7);
                    break;
                case 8:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W8);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W8);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W8);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W8);
                    break;
                case 9:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W9);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W9);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W9);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W9);
                    break;
                case 10:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W10);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W10);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W10);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W10);
                    break;
                case 11:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W11);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W11);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W11);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W11);
                    break;
                case 12:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W12);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W12);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W12);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W12);
                    break;
                case 13:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W13);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W13);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W13);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W13);
                    break;
                case 14:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W14);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W14);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W14);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W14);
                    break;
                case 15:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W15);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W15);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W15);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W15);
                    break;
                case 16:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W16);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W16);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W16);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W16);
                    break;
                case 17:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W17);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W17);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W17);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W17);
                    break;
                case 18:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W18);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W18);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W18);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W18);
                    break;
                case 19:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W19);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W19);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W19);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W19);
                    break;
                case 20:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W20);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W20);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W20);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W20);
                    break;
                case 21:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W21);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W21);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W21);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W21);
                    break;
                case 22:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W22);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W22);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W22);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W22);
                    break;
                case 23:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W23);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W23);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W23);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W23);
                    break;
                case 24:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W24);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W24);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W24);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W24);
                    break;
                case 25:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W25);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W25);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W25);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W25);
                    break;
                case 26:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W26);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W26);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W26);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W26);
                    break;
                case 27:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W27);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W27);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W27);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W27);
                    break;
                case 28:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W28);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W28);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W28);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W28);
                    break;
                case 29:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W29);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W29);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W29);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W29);
                    break;
                case 30:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W30);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W30);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W30);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W30);
                    break;
                case 31:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W31);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W31);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W31);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W31);
                    break;
                case 32:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W32);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W32);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W32);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W32);
                    break;
                case 33:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W33);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W33);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W33);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W33);
                    break;
                case 34:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W34);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W34);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W34);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W34);
                    break;
                case 35:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W35);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W35);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W35);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W35);
                    break;
                case 36:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W36);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W36);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W36);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W36);
                    break;
                case 37:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W37);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W37);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W37);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W37);
                    break;
                case 38:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W38);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W38);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W38);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W38);
                    break;
                case 39:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W39);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W39);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W39);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W39);
                    break;
                case 40:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W40);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W40);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W40);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W40);
                    break;
                case 41:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W41);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W41);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W41);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W41);
                    break;
                case 42:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W42);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W42);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W42);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W42);
                    break;
                case 43:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W43);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W43);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W43);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W43);
                    break;
                case 44:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W44);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W44);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W44);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W44);
                    break;
                case 45:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W45);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W45);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W45);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W45);
                    break;
                case 46:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W46);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W46);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W46);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W46);
                    break;
                case 47:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W47);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W47);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W47);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W47);
                    break;
                case 48:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W48);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W48);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W48);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W48);
                    break;
                case 49:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W49);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W49);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W49);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W49);
                    break;
                case 50:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W50);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W50);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W50);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W50);
                    break;
                case 51:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W51);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W51);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W51);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W51);
                    break;
                case 52:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W52);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W52);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W52);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W52);
                    break;
                case 53:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W53);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W53);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W53);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W53);
                    break;
                case 54:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W54);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W54);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W54);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W54);
                    break;
                case 55:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W55);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W55);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W55);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W55);
                    break;
                case 56:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W56);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W56);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W56);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W56);
                    break;
                case 57:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W57);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W57);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W57);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W57);
                    break;
                case 58:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W58);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W58);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W58);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W58);
                    break;
                case 59:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W59);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W59);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W59);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W59);
                    break;
                case 60:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W60);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W60);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W60);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W60);
                    break;
                case 61:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W61);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W61);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W61);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W61);
                    break;
                case 62:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W62);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W62);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W62);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W62);
                    break;
                case 63:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W63);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W63);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W63);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W63);
                    break;
                case 64:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W64);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W64);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W64);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W64);
                    break;
                case 65:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W65);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W65);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W65);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W65);
                    break;
                case 66:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W66);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W66);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W66);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W66);
                    break;
                case 67:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W67);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W67);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W67);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W67);
                    break;
                case 68:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W68);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W68);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W68);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W68);
                    break;
                case 69:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W69);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W69);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W69);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W69);
                    break;
                case 70:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W70);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W70);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W70);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W70);
                    break;
                case 71:
                    row_idx[w]= read_channel_intel(CHANNEL_ROWIDX_W71);
                    finalColIdx[w]= read_channel_intel(CHANNEL_COLIDX_W71);
                    row_idx_rev[w]= read_channel_intel(CHANNEL_ROWIDX_REV_W71);
                    finalColIdx_rev[w]= read_channel_intel(CHANNEL_COLIDX_REV_W71);
                    break;
            };//end switch
        }//end worker
        #pragma unroll 1
        for(unsigned short w=0; w<WORKERS; w++){
            seqA_align_end[pair+w]= row_idx[w]+1;
            seqB_align_end[pair+w]= finalColIdx[w]+1;
            seqA_align_beg[pair+w]= row_idx_rev[w]-1;
            seqB_align_beg[pair+w]= finalColIdx_rev[w];
        }
    }//end pair
}//end storeResults function
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw0()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W0);
            write_channel_intel(CHANNELB_REV_W0, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W0);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W0, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw1()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=1;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W1);
            write_channel_intel(CHANNELB_REV_W1, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W1);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W1, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw2()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=2;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W2);
            write_channel_intel(CHANNELB_REV_W2, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W2);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W2, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw3()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=3;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W3);
            write_channel_intel(CHANNELB_REV_W3, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W3);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W3, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw4()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=4;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W4);
            write_channel_intel(CHANNELB_REV_W4, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W4);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W4, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw5()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=5;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W5);
            write_channel_intel(CHANNELB_REV_W5, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W5);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W5, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw6()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=6;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W6);
            write_channel_intel(CHANNELB_REV_W6, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W6);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W6, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw7()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=7;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W7);
            write_channel_intel(CHANNELB_REV_W7, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W7);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W7, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw8()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=8;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W8);
            write_channel_intel(CHANNELB_REV_W8, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W8);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W8, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw9()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=9;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W9);
            write_channel_intel(CHANNELB_REV_W9, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W9);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W9, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw10()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=10;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W10);
            write_channel_intel(CHANNELB_REV_W10, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W10);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw11()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=11;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W11);
            write_channel_intel(CHANNELB_REV_W11, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W11);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw12()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=12;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W12);
            write_channel_intel(CHANNELB_REV_W12, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W12);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W12, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw13()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=13;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W13);
            write_channel_intel(CHANNELB_REV_W13, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W13);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W13, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W13, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw14()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=14;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W14);
            write_channel_intel(CHANNELB_REV_W14, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W14);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W14, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W14, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw15()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=15;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W15);
            write_channel_intel(CHANNELB_REV_W15, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W15);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W15, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W15, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw16()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=16;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W16);
            write_channel_intel(CHANNELB_REV_W16, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W16);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W16, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W16, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw17()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=17;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W17);
            write_channel_intel(CHANNELB_REV_W17, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W17);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W17, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W17, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw18()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=18;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W18);
            write_channel_intel(CHANNELB_REV_W18, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W18);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W18, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W18, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw19()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=19;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W19);
            write_channel_intel(CHANNELB_REV_W19, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W19);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W19, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W19, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw20()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=20;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W20);
            write_channel_intel(CHANNELB_REV_W20, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W20);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W20, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W20, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw21()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=21;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W21);
            write_channel_intel(CHANNELB_REV_W21, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W21);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W21, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W21, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw22()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=22;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W22);
            write_channel_intel(CHANNELB_REV_W22, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W22);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W22, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W22, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw23()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=23;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W23);
            write_channel_intel(CHANNELB_REV_W23, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W23);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W23, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W23, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw24()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=24;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W24);
            write_channel_intel(CHANNELB_REV_W24, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W24);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W24, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W24, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw25()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=25;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W25);
            write_channel_intel(CHANNELB_REV_W25, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W25);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W25, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W25, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw26()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=26;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W26);
            write_channel_intel(CHANNELB_REV_W26, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W26);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W26, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W26, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw27()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=27;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W27);
            write_channel_intel(CHANNELB_REV_W27, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W27);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W27, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W27, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw28()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=28;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W28);
            write_channel_intel(CHANNELB_REV_W28, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W28);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W28, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W28, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw29()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=29;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W29);
            write_channel_intel(CHANNELB_REV_W29, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W29);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W29, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W29, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw30()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=30;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W30);
            write_channel_intel(CHANNELB_REV_W30, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W30);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W30, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W30, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw31()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=31;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W31);
            write_channel_intel(CHANNELB_REV_W31, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W31);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W31, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W31, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw32()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=32;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W32);
            write_channel_intel(CHANNELB_REV_W32, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W32);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W32, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W32, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw33()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=33;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W33);
            write_channel_intel(CHANNELB_REV_W33, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W33);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W33, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W33, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw34()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=34;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W34);
            write_channel_intel(CHANNELB_REV_W34, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W34);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W34, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W34, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw35()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=35;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W35);
            write_channel_intel(CHANNELB_REV_W35, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W35);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W35, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W35, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw36()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=36;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W36);
            write_channel_intel(CHANNELB_REV_W36, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W36);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W36, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W36, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw37()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=37;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W37);
            write_channel_intel(CHANNELB_REV_W37, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W37);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W37, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W37, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw38()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=38;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W38);
            write_channel_intel(CHANNELB_REV_W38, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W38);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W38, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W38, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw39()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=39;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W39);
            write_channel_intel(CHANNELB_REV_W39, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W39);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W39, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W39, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw40()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=40;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W40);
            write_channel_intel(CHANNELB_REV_W40, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W40);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W40, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W40, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw41()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=41;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W41);
            write_channel_intel(CHANNELB_REV_W41, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W41);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W41, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W41, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw42()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=42;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W42);
            write_channel_intel(CHANNELB_REV_W42, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W42);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W42, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W42, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw43()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=43;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W43);
            write_channel_intel(CHANNELB_REV_W43, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W43);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W43, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W43, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw44()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=44;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W44);
            write_channel_intel(CHANNELB_REV_W44, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W44);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W44, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W44, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw45()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=45;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W45);
            write_channel_intel(CHANNELB_REV_W45, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W45);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W45, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W45, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw46()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=46;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W46);
            write_channel_intel(CHANNELB_REV_W46, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W46);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W46, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W46, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw47()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=47;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W47);
            write_channel_intel(CHANNELB_REV_W47, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W47);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W47, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W47, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw48()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=48;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W48);
            write_channel_intel(CHANNELB_REV_W48, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W48);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W48, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W48, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw49()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=49;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W49);
            write_channel_intel(CHANNELB_REV_W49, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W49);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W49, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W49, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw50()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=50;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W50);
            write_channel_intel(CHANNELB_REV_W50, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W50);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W50, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W50, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw51()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=51;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W51);
            write_channel_intel(CHANNELB_REV_W51, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W51);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W51, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W51, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw52()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=52;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W52);
            write_channel_intel(CHANNELB_REV_W52, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W52);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W52, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W52, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw53()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=53;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W53);
            write_channel_intel(CHANNELB_REV_W53, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W53);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W53, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W53, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw54()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=54;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W54);
            write_channel_intel(CHANNELB_REV_W54, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W54);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W54, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W54, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw55()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=55;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W55);
            write_channel_intel(CHANNELB_REV_W55, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W55);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W55, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W55, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw56()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=56;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W56);
            write_channel_intel(CHANNELB_REV_W56, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W56);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W56, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W56, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw57()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=57;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W57);
            write_channel_intel(CHANNELB_REV_W57, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W57);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W57, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W57, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw58()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=58;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W58);
            write_channel_intel(CHANNELB_REV_W58, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W58);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W58, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W58, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw59()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=59;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W59);
            write_channel_intel(CHANNELB_REV_W59, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W59);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W59, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W59, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw60()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=60;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W60);
            write_channel_intel(CHANNELB_REV_W60, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W60);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W60, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W60, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw61()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=61;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W61);
            write_channel_intel(CHANNELB_REV_W61, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W61);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W61, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W61, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw62()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=62;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W62);
            write_channel_intel(CHANNELB_REV_W62, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W62);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W62, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W62, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw63()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=63;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W63);
            write_channel_intel(CHANNELB_REV_W63, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W63);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W63, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W63, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw64()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=64;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W64);
            write_channel_intel(CHANNELB_REV_W64, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W64);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W64, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W64, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw65()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=65;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W65);
            write_channel_intel(CHANNELB_REV_W65, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W65);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W65, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W65, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw66()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=66;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W66);
            write_channel_intel(CHANNELB_REV_W66, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W66);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W66, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W66, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw67()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=67;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W67);
            write_channel_intel(CHANNELB_REV_W67, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W67);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W67, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W67, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw68()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=68;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W68);
            write_channel_intel(CHANNELB_REV_W68, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W68);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W68, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W68, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw69()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=69;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W69);
            write_channel_intel(CHANNELB_REV_W69, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W69);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W69, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W69, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw70()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=70;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W70);
            write_channel_intel(CHANNELB_REV_W70, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W70);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W70, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W70, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw71()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=71;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++){
            private_b[offset] = read_channel_intel(CHANNELB_W71);
            write_channel_intel(CHANNELB_REV_W71, private_b[offset]);
        }
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=0, finalColIdx=0;
        #pragma unroll 1
        for(unsigned short i = 0; i< A_BLOCK_WIDTH; i++)
        {
            char a_i = read_channel_intel(CHANNELA_W71);
            short previous=0,maxRow_i=0,score_i=0,col_idx=0;
            #pragma unroll 1
            for(short j=0; j<B_BLOCK_WIDTH; j++)
            {
                unsigned short j0= B_BLOCK_WIDTH-1-j;
                short current = row[j0] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j0]?current: maxCol[j0];
                current = current>0?current: 0;
                // update max score
                if(score_i<current){
                   score_i= current;
                   col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j0] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j0] = aux2> aux3?aux2:aux3;
                row[j0] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_W71, row_idx);
        write_channel_intel(CHANNEL_COLIDX_W71, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev0()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=0;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W0);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W0);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W0, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W0, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev1()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=1;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W1);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W1);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W1, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W1, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev2()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=2;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W2);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W2);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W2, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W2, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev3()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=3;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W3);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W3);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W3, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W3, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev4()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=4;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W4);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W4);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W4, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W4, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev5()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=5;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W5);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W5);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W5, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W5, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev6()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=6;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W6);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W6);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W6, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W6, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev7()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=7;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W7);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W7);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W7, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W7, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev8()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=8;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W8);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W8);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W8, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W8, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev9()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=9;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W9);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W9);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W9, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W9, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev10()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=10;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W10);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W10);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W10, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W10, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev11()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=11;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W11);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W11);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W11, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W11, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev12()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=12;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W12);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W12);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W12, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W12, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev13()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=13;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W13);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W13);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W13, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W13, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev14()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=14;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W14);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W14);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W14, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W14, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev15()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=15;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W15);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W15);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W15, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W15, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev16()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=16;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W16);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W16);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W16, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W16, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev17()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=17;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W17);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W17);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W17, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W17, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev18()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=18;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W18);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W18);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W18, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W18, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev19()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=19;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W19);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W19);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W19, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W19, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev20()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=20;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W20);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W20);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W20, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W20, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev21()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=21;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W21);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W21);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W21, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W21, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev22()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=22;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W22);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W22);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W22, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W22, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev23()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=23;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W23);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W23);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W23, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W23, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev24()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=24;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W24);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W24);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W24, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W24, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev25()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=25;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W25);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W25);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W25, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W25, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev26()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=26;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W26);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W26);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W26, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W26, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev27()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=27;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W27);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W27);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W27, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W27, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev28()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=28;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W28);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W28);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W28, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W28, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev29()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=29;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W29);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W29);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W29, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W29, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev30()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=30;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W30);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W30);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W30, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W30, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev31()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=31;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W31);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W31);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W31, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W31, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev32()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=32;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W32);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W32);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W32, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W32, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev33()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=33;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W33);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W33);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W33, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W33, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev34()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=34;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W34);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W34);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W34, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W34, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev35()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=35;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W35);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W35);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W35, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W35, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev36()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=36;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W36);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W36);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W36, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W36, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev37()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=37;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W37);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W37);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W37, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W37, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev38()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=38;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W38);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W38);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W38, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W38, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev39()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=39;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W39);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W39);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W39, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W39, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev40()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=40;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W40);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W40);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W40, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W40, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev41()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=41;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W41);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W41);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W41, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W41, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev42()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=42;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W42);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W42);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W42, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W42, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev43()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=43;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W43);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W43);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W43, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W43, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev44()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=44;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W44);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W44);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W44, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W44, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev45()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=45;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W45);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W45);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W45, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W45, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev46()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=46;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W46);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W46);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W46, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W46, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev47()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=47;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W47);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W47);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W47, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W47, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev48()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=48;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W48);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W48);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W48, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W48, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev49()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=49;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W49);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W49);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W49, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W49, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev50()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=50;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W50);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W50);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W50, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W50, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev51()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=51;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W51);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W51);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W51, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W51, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev52()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=52;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W52);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W52);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W52, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W52, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev53()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=53;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W53);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W53);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W53, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W53, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev54()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=54;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W54);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W54);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W54, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W54, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev55()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=55;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W55);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W55);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W55, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W55, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev56()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=56;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W56);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W56);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W56, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W56, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev57()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=57;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W57);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W57);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W57, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W57, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev58()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=58;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W58);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W58);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W58, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W58, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev59()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=59;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W59);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W59);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W59, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W59, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev60()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=60;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W60);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W60);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W60, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W60, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev61()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=61;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W61);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W61);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W61, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W61, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev62()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=62;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W62);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W62);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W62, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W62, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev63()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=63;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W63);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W63);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W63, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W63, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev64()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=64;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W64);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W64);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W64, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W64, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev65()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=65;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W65);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W65);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W65, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W65, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev66()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=66;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W66);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W66);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W66, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W66, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev67()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=67;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W67);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W67);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W67, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W67, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev68()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=68;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W68);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W68);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W68, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W68, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev69()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=69;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W69);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W69);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W69, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W69, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev70()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=70;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W70);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W70);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W70, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W70, finalColIdx);
    }
}
__attribute__((reqd_work_group_size(1,1,1)))
__kernel void sw_rev71()
{
    __local short row[B_BLOCK_WIDTH];
    __local short maxCol[B_BLOCK_WIDTH];
    #pragma unroll 1
    for(unsigned pair=71;pair<PAIR_BLOCKS; pair+=WORKERS)
    {
        char private_b[B_BLOCK_WIDTH];
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
            private_b[offset] = read_channel_intel(CHANNELB_REV_W71);
        for(unsigned short offset=0; offset<B_BLOCK_WIDTH; offset++)
        {
            row[offset]=0;
            maxCol[offset]=0;
        }
        short score=0;
        unsigned short row_idx=A_BLOCK_WIDTH-1, finalColIdx=B_BLOCK_WIDTH-1;
        #pragma unroll 1
        for(short i = A_BLOCK_WIDTH-1; i>=0; i--)
        {
            char a_i = read_channel_intel(CHANNELA_REV_W71);
            short previous=0,maxRow_i=0,score_i=0,col_idx=B_BLOCK_WIDTH-1;
            #pragma unroll 1
            for(short j=B_BLOCK_WIDTH-1; j>=0; j--)
            {
                short current = row[j] + (a_i==private_b[j] ? MATCH : MISMATCH);
                current = current> maxRow_i?current:maxRow_i;
                current = current>maxCol[j]?current: maxCol[j];
                current = current>0?current: 0;
                if(score_i<current){
                    score_i= current;
                    col_idx= j;
                }
                short aux1 = maxRow_i + EXTEND_GAP;
                short aux2 = maxCol[j] + EXTEND_GAP;
                short aux3 = current + START_GAP;
                maxRow_i = aux1> aux3?aux1:aux3;
                maxCol[j] = aux2> aux3?aux2:aux3;
                row[j] = previous;
                previous = current;
            }
            if(score<score_i){
                score= score_i;
                row_idx= i;
                finalColIdx= col_idx;
            }
        }//end all rows
        write_channel_intel(CHANNEL_ROWIDX_REV_W71, row_idx);
        write_channel_intel(CHANNEL_COLIDX_REV_W71, finalColIdx);
    }
}
