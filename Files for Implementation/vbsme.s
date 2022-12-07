#  Fall 2022
#  Team Members:    
#  % Effort    :   
#
# ECE369A,  
# 

########################################################################################################################
### data
########################################################################################################################
.data
# test input
# asize : dimensions of the frame [i, j] and window [k, l]
#         i: number of rows,  j: number of cols
#         k: number of rows,  l: number of cols  
# frame : frame data with i*j number of pixel values
# window: search window with k*l number of pixel values
#
# $v0 is for row / $v1 is for column


# test 1 For the 64X64 frame and a 4X4 window size
# 
asize1: .word    64,   64,   4,   4    #i,   j,   k,   l
frame1: .word 255,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  
	.word 240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  250,  
	.word 242,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  236,  249,  
	.word 243,  234,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  230,  235,  248,  
	.word 244,  235,  234,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  232,  229,  234,  247,  
	.word 245,  236,  235,  242,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  242,  231,  228,  233,  246,  
	.word 246,  237,  236,  243,  228,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  227,  230,  241,  230,  227,  232,  245,  
	.word 247,  238,  237,  244,  229,  252,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  226,  229,  240,  229,  226,  231,  244,  
	.word 248,  239,  238,  245,  230,  253,  254,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  230,  225,  228,  239,  228,  225,  230,  243,  
	.word 249,  240,  239,  246,  231,  254,  225,  234,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  
	.word 250,  241,  240,  247,  232,  225,  226,  235,  252,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  
	.word 251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  
	.word 252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  
	.word 253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  
	.word 254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  
	.word 225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  
	.word 226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  
	.word 227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  236,  249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  
	.word 228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  234,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  230,  235,  248,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  
	.word 229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  244,  235,  234,  240,  101,  101,  101,  101,  235,  234,  233,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  232,  229,  234,  247,  238,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  
	.word 230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  232,  245,  236,  235,  242,  101,  101,  101,  101,  252,  251,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  242,  231,  228,  233,  246,  237,  236,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  
	.word 231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  228,  233,  246,  237,  236,  243,  101,  101,  101,  101,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  232,  231,  230,  229,  227,  230,  241,  230,  227,  232,  245,  236,  235,  242,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  
	.word 232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  232,  229,  234,  247,  238,  237,  244,  101,  101,  101,  101,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  226,  229,  240,  229,  226,  231,  244,  235,  234,  241,  226,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  
	.word 233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  244,  233,  230,  235,  248,  239,  238,  245,  230,  253,  254,  232,  231,  230,  229,  228,  227,  226,  225,  254,  253,  252,  251,  250,  249,  248,  247,  246,  245,  243,  230,  225,  228,  239,  228,  225,  230,  243,  234,  233,  240,  225,  248,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  
	.word 234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  234,  245,  234,  231,  236,  249,  240,  239,  246,  231,  254,  225,  234,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  233,  232,  239,  254,  247,  248,  227,  244,  239,  242,  253,  242,  239,  244,  227,  
	.word 235,  226,  225,  232,  247,  240,  241,  250,  237,  232,  235,  246,  235,  232,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  246,  245,  244,  243,  242,  241,  240,  239,  238,  237,  236,  235,  234,  233,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  232,  231,  238,  253,  246,  247,  226,  243,  238,  241,  252,  241,  238,  243,  226,  
	.word 236,  227,  226,  233,  248,  241,  242,  251,  238,  233,  236,  247,  236,  233,  238,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  250,  249,  248,  247,  246,  245,  244,  243,  242,  241,  240,  239,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  231,  230,  237,  252,  245,  246,  225,  242,  237,  240,  251,  240,  237,  242,  225,  
	.word 237,  228,  227,  234,  249,  242,  243,  252,  239,  234,  237,  248,  237,  234,  239,  252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  232,  231,  230,  229,  228,  227,  226,  225,  100,  100,  100,  100,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  230,  229,  236,  251,  244,  245,  254,  241,  236,  239,  250,  239,  236,  241,  254,  
	.word 238,  229,  228,  235,  250,  243,  244,  253,  240,  235,  238,  249,  238,  235,  240,  253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  252,  251,  250,  249,  248,  247,  246,  100,  99,  100,  100,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  229,  228,  235,  250,  243,  244,  253,  240,  235,  238,  249,  238,  235,  240,  253,  
	.word 239,  230,  229,  236,  251,  244,  245,  254,  241,  236,  239,  250,  239,  236,  241,  254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  250,  249,  248,  120,  120,  245,  100,  100,  99,  100,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  228,  227,  234,  249,  242,  243,  252,  239,  234,  237,  248,  237,  234,  239,  252,  
	.word 240,  231,  230,  237,  252,  245,  246,  225,  242,  237,  240,  251,  240,  237,  242,  225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  226,  225,  120,  120,  120,  100,  100,  100,  100,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  227,  226,  233,  248,  241,  242,  251,  238,  233,  236,  247,  236,  233,  238,  251,  
	.word 241,  232,  231,  238,  253,  246,  247,  226,  243,  238,  241,  252,  241,  238,  243,  226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  240,  239,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  226,  225,  232,  247,  240,  241,  250,  237,  232,  235,  246,  235,  232,  237,  250,  
	.word 242,  233,  232,  239,  254,  247,  248,  227,  244,  239,  242,  253,  242,  239,  244,  227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  101,  120,  120,  120,  120,  120,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  234,  245,  234,  231,  236,  249,  
	.word 243,  234,  233,  240,  225,  248,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  120,  120,  120,  120,  120,  120,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  244,  233,  230,  235,  248,  
	.word 244,  235,  234,  241,  226,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  120,  120,  120,  120,  120,  120,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  232,  229,  234,  247,  
	.word 245,  236,  235,  242,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  229,  120,  120,  120,  120,  120,  120,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  228,  233,  246,  
	.word 246,  237,  236,  243,  228,  251,  252,  231,  248,  243,  246,  227,  246,  243,  248,  231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  233,  234,  120,  120,  120,  120,  120,  120,  241,  227,  250,  251,  230,  247,  242,  245,  226,  245,  242,  247,  230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  232,  245,  
	.word 247,  238,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  245,  246,  247,  120,  120,  120,  101,  252,  253,  254,  225,  249,  250,  229,  246,  241,  244,  225,  244,  241,  246,  229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  244,  
	.word 248,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  249,  228,  245,  240,  243,  254,  243,  240,  245,  228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  
	.word 249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  227,  244,  239,  242,  253,  242,  239,  244,  227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  
	.word 250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  226,  225,  232,  247,  240,  241,  250,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  243,  238,  241,  252,  241,  238,  243,  226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  
	.word 251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  227,  226,  233,  248,  241,  242,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  237,  240,  251,  240,  237,  242,  225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  
	.word 252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  228,  227,  234,  249,  242,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  239,  250,  239,  236,  241,  254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  
	.word 253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  229,  228,  235,  250,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  249,  238,  235,  240,  253,  244,  243,  250,  235,  228,  229,  238,  225,  250,  253,  234,  253,  250,  225,  238,  
	.word 254,  245,  244,  251,  236,  229,  230,  239,  226,  251,  254,  235,  254,  251,  226,  239,  230,  229,  236,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  237,  234,  239,  252,  243,  242,  249,  234,  227,  228,  237,  254,  249,  252,  233,  252,  249,  254,  237,  
	.word 225,  246,  245,  252,  237,  230,  231,  240,  227,  252,  225,  236,  225,  252,  227,  240,  231,  230,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  233,  238,  251,  242,  241,  248,  233,  226,  227,  236,  253,  248,  251,  232,  251,  248,  253,  236,  
	.word 226,  247,  246,  253,  238,  231,  232,  241,  228,  253,  226,  237,  226,  253,  228,  241,  232,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  237,  250,  241,  240,  247,  232,  225,  226,  235,  252,  247,  250,  231,  250,  247,  252,  235,  
	.word 227,  248,  247,  254,  239,  232,  233,  242,  229,  254,  227,  238,  227,  254,  229,  242,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  249,  240,  239,  246,  231,  254,  225,  234,  251,  246,  249,  230,  249,  246,  251,  234,  
	.word 228,  249,  248,  225,  240,  233,  234,  243,  230,  225,  228,  239,  228,  225,  230,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  239,  238,  245,  230,  253,  254,  233,  250,  245,  248,  229,  248,  245,  250,  233,  
	.word 229,  250,  249,  226,  241,  234,  235,  244,  231,  226,  229,  240,  229,  226,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  237,  244,  229,  252,  253,  232,  249,  244,  247,  228,  247,  244,  249,  232,  
	.word 230,  251,  250,  227,  242,  235,  236,  245,  232,  227,  230,  241,  230,  227,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  243,  102,  102,  102,  102,  248,  243,  246,  227,  246,  243,  248,  231,  
	.word 231,  252,  251,  228,  243,  236,  237,  246,  233,  228,  231,  242,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  102,  102,  102,  102,  247,  242,  245,  226,  245,  242,  247,  230,  
	.word 232,  253,  252,  229,  244,  237,  238,  247,  234,  229,  232,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  102,  102,  102,  102,  246,  241,  244,  225,  244,  241,  246,  229,  
	.word 233,  254,  253,  230,  245,  238,  239,  248,  235,  230,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  102,  102,  102,  102,  245,  240,  243,  254,  243,  240,  245,  228,  
	.word 234,  225,  254,  231,  246,  239,  240,  249,  236,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  227,  244,  239,  242,  253,  242,  239,  244,  227,  
	.word 235,  226,  225,  232,  247,  240,  241,  250,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  243,  238,  241,  252,  241,  238,  243,  226,  
	.word 236,  227,  226,  233,  248,  241,  242,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  237,  240,  251,  240,  237,  242,  225,  
	.word 237,  228,  227,  234,  249,  242,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  239,  250,  239,  236,  241,  254,  
	.word 238,  229,  228,  235,  250,  243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  249,  238,  235,  240,  253,  
	.word 239,  230,  229,  236,  251,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  237,  234,  239,  252,  
	.word 240,  231,  230,  237,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  233,  238,  251,  
	.word 241,  232,  231,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  237,  250,  
	.word 242,  233,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  249,  
	.word 243,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247,  248,  249,  250,  251,  252,  253,  254,  225,  226,  227,  228,  229,  230,  231,  232,  233,  234,  235,  236,  237,  238,  239,  240,  241,  242,  243,  244,  245,  246,  247
                  
window1: .word    99,  99,  99,  99,   
          .word    99,  99,  99,  99,   
          .word    99,  99,  99,  99,   
           .word   99,  99,  99,  99
			




         
newline: .asciiz     "\n" 
window: .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        .word 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  


########################################################################################################################
### main
########################################################################################################################

.text

.globl main

main:        
    # Start test 1 
    ############################################################
    la      $a0, asize1     # 1st parameter: address of asize1[0]
    la      $a1, frame1     # 2nd parameter: address of frame1[0]
    la      $a2, window1    # 3rd parameter: address of window1[0] 
   
    jal     vbsme           # call function

    j       end_program                 # Return

end_program:                    # remain in infinite loop
	j end_program
################### Print Result ####################################
#print_result:
    # Printing $v0
 #   add     $a0, $v0, $zero     # Load $v0 for printing
 #   li      $v0, 1              # Load the system call numbers
 #   syscall
   
    # Print newline.
 #   la      $a0, newline          # Load value for printing
 #   li      $v0, 4                # Load the system call numbers
 #   syscall
   
    # Printing $v1
 #   add     $a0, $v1, $zero      # Load $v1 for printing
 #   li      $v0, 1                # Load the system call numbers
 #   syscall

    # Print newline.
 #   la      $a0, newline          # Load value for printing
 #   li      $v0, 4                # Load the system call numbers
 #   syscall
   
    # Print newline.
 #   la      $a0, newline          # Load value for printing
 #   li      $v0, 4                # Load the system call numbers
 #   syscall
   
 #   jr      $ra                   #function return

#####################################################################
### vbsme
#####################################################################


# vbsme.s 
# motion estimation is a routine in h.264 video codec that 
# takes about 80% of the execution time of the whole code
# given a frame(2d array, x and y dimensions can be any integer 
# between 16 and 64) where "frame data" is stored under "frame"  
# and a window (2d array of size 4x4, 4x8, 8x4, 8x8, 8x16, 16x8 or 16x16) 
# where "window data" is stored under "window" 
# and size of "window" and "frame" arrays are stored under "asize"

# - initially current sum of difference is set to a very large value
# - move "window" over the "frame" one cell at a time starting with location (0,0)
# - moves are based circular pattern 
# - for each move, function calculates  the sum of absolute difference (SAD) 
#   between the window and the overlapping block on the frame.
# - if the calculated sum of difference is LESS THAN the current sum of difference
#   then the current sum of difference is updated and the coordinate of the top left corner 
#   for that matching block in the frame is recorded. 

# for example SAD of two 4x4 arrays "window" and "block" shown below is 3  
# window         block
# -------       --------
# 1 2 2 3       1 4 2 3  
# 0 0 3 2       0 0 3 2
# 0 0 0 0       0 0 0 0 
# 1 0 0 5       1 0 0 4

# program keeps track of the window position that results 
# with the minimum sum of absolute difference. 
# after scannig the whole frame
# program returns the coordinates of the block with the minimum SAD
# in $v0 (row) and $v1 (col) 


# Sample Inputs and Output shown below:
# Frame:
#
#  0   1   2   3   0   0   0   0   0   0   0   0   0   0   0   0 
#  1   2   3   4   4   5   6   7   8   9  10  11  12  13  14  15 
#  2   3  32   1   2   3  12  14  16  18  20  22  24  26  28  30 
#  3   4   1   2   3   4  18  21  24  27  30  33  36  39  42  45 
#  0   4   2   3   4   5  24  28  32  36  40  44  48  52  56  60 
#  0   5   3   4   5   6  30  35  40  45  50  55  60  65  70  75 
#  0   6  12  18  24  30  36  42  48  54  60  66  72  78  84  90 
#  0   7  14  21  28  35  42  49  56  63  70  77  84  91  98 105 
#  0   8  16  24  32  40  48  56  64  72  80  88  96 104 112 120 
#  0   9  18  27  36  45  54  63  72  81  90  99 108 117 126 135 
#  0  10  20  30  40  50  60  70  80  90 100 110 120 130 140 150 
#  0  11  22  33  44  55  66  77  88  99 110 121 132 143 154 165 
#  0  12  24  36  48  60  72  84  96 108 120 132   0   1   2   3 
#  0  13  26  39  52  65  78  91 104 117 130 143   1   2   3   4 
#  0  14  28  42  56  70  84  98 112 126 140 154   2   3   4   5 
#  0  15  30  45  60  75  90 105 120 135 150 165   3   4   5   6 

# Window:
#  0   1   2   3 
#  1   2   3   4 
#  2   3   4   5 
#  3   4   5   6 

# cord x = 12, cord y = 12 returned in $v0 and $v1 registers

.text
.globl  vbsme

# Your program must follow circular search pattern.  

# Preconditions:
#   1st parameter (a0) address of the first element of the dimension info (address of asize[0])
#   2nd parameter (a1) address of the first element of the frame array (address of frame[0][0])
#   3rd parameter (a2) address of the first element of the window array (address of window[0][0])
# Postconditions:	
#   result (v0) x coordinate of the block in the frame with the minimum SAD
#          (v1) y coordinate of the block in the frame with the minimum SAD


# Begin subroutine

vbsme:  
    
    # li      $v0, 0              # reset $v0 and $V1
    # li      $v1, 0

    # insert your code here

    add $t0, $zero, $zero
    add $t1, $zero, $zero
    add $t2, $zero, $zero
    add $t3, $zero, $zero
    add $t4, $zero, $zero
    add $t5, $zero, $zero
    add $t6, $zero, $zero
    add $t7, $zero, $zero
    add $t8, $zero, $zero
    add $t9, $zero, $zero
    add $s0, $zero, $zero
    add $s1, $zero, $zero
    add $s2, $zero, $zero
    add $s3, $zero, $zero
    add $s4, $zero, $zero
    add $s5, $zero, $zero
    add $s6, $zero, $zero
    add $s7, $zero, $zero









    addi $t9, $t9, 32767
    lw $t0, 0($a0) # load numRowsFrame into t0
    lw $t1, 4($a0) # load numColsFrame into t1
    lw $t2, 8($a0) # load numRowsWindow into t2
    lw $t3, 12($a0) # load numColsWindow into t3

    sub $s0, $t1, $t3  # move_right = numColsFrame - numColsWindow; (initial times i have to move)
    sub $s1, $t0, $t2   # move_down = numRowsFrame - numRowsWindow;
#    sub $s2, $t1, $t3   # move_left = numColsFrame - numColsWindow; 
#    sub $s3, $t0, $t2   # move_up = numRowsFrame - numRowsWindow - 1;
#    addi $s3, $s3, -1   # part of above comment
#    slt $t4, $s3, $zero # if s3 < 0 set t4 to 1
#    beq $t4, $zero, skip  # if s3>0 jump to skip
#    add $s3, $zero, $zero # set to 0
    # calculate how many times in total we move 
skip:
    addi $t4, $s0, 1   # temp = ColsFrame-ColsWindow + 1
    addi $t5, $s1, 1   # temp2 = RowsFrame - RowsWindow + 1
    mul $t6, $t4, $t5  # temp3 = ColsFrame-ColsWindow + 1)*(RowsFrame-RowsWindow + 1)  **** PSEUDO INSTRUCTION
    addi $s7, $t6, -1    # numIterations = (ColsFrame-ColsWindow + 1)*(RowsFrame-RowsWindow + 1) - 1;







# Lines 5-31 load the 2d target array into t6 as a 1d array
la $t7, window # allocating the return to be of size 16x16 may chanch later to dynamic memory allocation
# set s5 and s6 to 0


j generateWindow




# ---------------------------------------------------------------------
.text
.globl generateWindow # USING REGISTER S5 AND S6 FOR X AND Y VALUES OF CORNER OF WINDOW AND S2 FOR RETURN
generateWindow:

# loaded dims of window into t2-t3 registers
lw $t6, 4($a0) # row size of frame (number of columns)
lw $t2, 8($a0) # row of window
lw $t3, 12($a0) # col of window 
add $t2, $t2, $s6 # add position in columns to row increment checker(i<wrow + y)
add $t3, $t3, $s5 # add position in row to columns increment checker(j<wcol+x)

add $t0, $t7, $zero # incrementor for position in the window(k)

# setup loop to loop through the addresses stored in a1(rows of frame)
add $t4, $s6, $zero # initialize t4 for looping through rows (i=y)
loopad: # loop row

add $t5, $s5, $zero # initialize t5 for looping through cols (j=x)

loopnum: # loop col
# s0-3

mul $t1, $t4, $t6 # multiply i incrementor by frow
add $t1, $t5, $t1 # add j incrementor to i*frow
sll $t1, $t1, 2 # multiply it all (previous 2 lines) by 4
add $t1, $t1, $a1 # offset base address by (i*frow+j)*4
addi $t0, $t0, 4 # increment the window incrementor(k++)
lw $s0, 0($t1) # get the value from memory
# need to fix, move incrementor here
sw $s0, -4($t0) # load value into window array


addi $t5, $t5, 1 # increment j incrementor(j++)
bne $t5, $t3, loopnum # check if the incrementor is equal to x+wcol
addi $t4, $t4, 1 # increment row incrementor (i++)
bne $t4, $t2, loopad # check if incrementor is equal y+wrow

addi $s7, $s7, -1
j sad # Jump to SAD function










moveWindow:        # This is the initialization, only ran when we need to do our first movement


    lw $t1, 4($a0) # load numColsFrame into t1
    lw $t3, 12($a0) # load numColsWindow into t3

    # s5,s6 = x,Y

    sub $t4, $t1, $t3
    beq $t4, $s5, xiscdif # checks if x = fcol-wcol

    beq $zero, $s5, xiszero # checks if x = 0

    andi $t5, $s6, 1
    bne $t5, $zero, incx # checks if y is odd
    addi $s5, $s5, -1
    j generateWindow
    xiscdif:
    andi $t5, $s6, 1
    bne $t5, $zero, incy # checks if y is odd
    addi $s5, $s5, -1
    j generateWindow
    xiszero:
    andi $t5, $s6, 1
    beq $t5, $zero, incy # checks if y is even
    addi $s5, $s5, 1
    j generateWindow
    incy:
    addi $s6, $s6, 1
    j generateWindow
    incx:
    addi $s5, $s5, 1
    j generateWindow
    







.text
.globl sad

sad:
            add $t6, $zero, $zero # initialize loop counter t5 is loop count max         
            
            add $t4, $zero, $a2   # incrementor t4 = a2 (address of target window)
            add $t8, $zero, $t7   # incrementor t8 = t7 (address of current window)  
            
            add $t0, $zero, $zero #t0 = 0 --> t0 is absolute difference
            lw $t5, 8($a0)        #t5 = rowSize of target window
            lw $t3, 12($a0)       #t3 = colSize of column window
            # mult $t5, $t3     #t5 * t3 = total loop count (TLC)
            # mflo $t5          #loading result from low register (assume no overflow into high register)
            mul $t5, $t5, $t3
            sll $t5, $t5, 2       # t5 = t5 * 4 = TLC * 4 because addresses are incremented by 4 

  sadloop:  
            lw $t1, 0($t8)        # loads value at address t7 into t1 (t7 is the address of the window a2)
            lw $t2, 0($t4)        # loads value at address t4 into t2 (t4 first loop = 0(a2))
            sub $t1, $t1, $t2     # t1 = t1 - t2
            slt $t3, $t1, $zero   # t3 = t1 < 0?
            beq $t3, $zero, pos   # if t3 == 0, jump pos
            sub $t3, $zero, $t1   # t3 = 0 - t1 (abs val of neg)
            add $t0, $t3, $t0     # t0 = t3 + t0 t3 is abs diff of the window values
            j negative

      pos:  add $t0, $t1, $t0
 negative:  addi $t6, $t6, 4        # increment t6 to next value


            addi $t4, $t4, 4        # increments t4 to the next address of a2
            addi $t8, $t8, 4        # increments t8 to the next address of t7


    # addi $t2, $t2, 4        # increment t2 to next value
            bne $t6, $t5, sadloop   # if t6 reaches (TLC * 4), loop

  exitsad:  slt $t4, $t0, $t9        # t4 = t0 < t9?
            beq $t4, $zero, nochange # if t4 == 0, jump nochange
            add $t9, $zero, $t0      # change t9(globalMin) to value of t0
            beq $t9, $zero, exitearly   # absolute difference = 0 --> perfect match
            add $v0, $s6, $zero      # update v1 (x coord of min)
            add $v1, $s5, $zero      # update v0 (y coord of min)
 nochange:  
            beq $s7, $zero, end     # if numIterations is zero, end our function
            j moveWindow
            
        #   addi $t1, $zero, 1      # t1 = 1
        #   addi $t2, $zero, 2      # t2 = 2
        #   addi $t3, $zero, 3      # t3 = 3
        #   addi $t4, $zero, 4      # t4 = 4
                                    # t8 = Direction Pointer for window movement
        #    beq $t8, $t1, moveRight # if t8 == 1, moveRight
        #    beq $t8, $t2, moveDown  # if t8 == 2, moveDown
        #    beq $t8, $t3, moveLeft  # if t8 == 3, moveLeft
        #    beq $t8, $t4, moveUp    # if t8 == 4, moveUp

 end:
      addi $s6, $zero, 7777
      jr $ra  # jump back to tester    
        
    
exitearly:  add $v0, $s6, $zero
            add $v1, $s5, $zero
            j end


    # insert your code here
   