#ifndef DATA
#define DATA
	#include <stdlib.h>
	#include <stdio.h>
	#define YYSTYPE struct Data
	#define NEW_DATA(data, value, temp) struct Data data;data.t=temp;data.val=value;
	struct Data{
		int val;
		int t;
	};
#endif
