/* Program to scan & print the tokens one by one
 * Procedure:
	1. main() asks lexeme() to give next token index while not complete...
	2. lexeme() makes the token, puts in symbol Table (if the token is not there), returns the masked index
	3. main() grabs that masked index, demasks it and prints the contents in a special format

 * Constraints:
	1. static symbol table size (we could've done ... using 1. dynamic allocation, 2. linked list, 3. file)
	2. continuous file opening & closing for single character (we could've done file operations once for each token detection)
 * IO:
	$ make[ENTER]
	$ ./lexeme <input_file_name>[ENTER]
 */
#include"myLex.h"
const int tM=300;	//token_Mask => to prevent confusion from empty characters with symTab index
int main(int argc, char *argv[]){
	int l=0;
	if(argc==1)
		goto R;
	fn=argv[1];	
	while((l=lexeme())!=EOF){
//		printf("%d\n",l);
		if(isNtBlank(l))
			printf("<%d,\"%s\">",sT[l-tM].val,sT[l-tM].name);
	}
//...Current symTab
/*	for(int i=0;i<neST;i++)
		printf("%s\t%d\n",sT[i].name,sT[i].val);
*/	printf("\n");
R:	return 0;
}
int isNtBlank(int c){ return (c!=9 && c!=10 && c!=32)?1:0; }
char gnc(){
	FILE *fp;
	char c=0;
	fp=fopen(fn,"r");
	if(fp==NULL){
		printf("Error!\n");
		return 0;
	}

	fseek(fp,po,SEEK_SET);
	c=fgetc(fp);
	po=ftell(fp);

	fclose(fp);
	fflush(fp);
	return c;
}
int putInSymTab(char *nm, int v){
	int f=-1,i;		// found, incrementor
// Search in symbol Table
	for(i=0;i<neST;i++){
		if(strcmp(sT[i].name,nm)==0){
			f=i;
			break;
		}
	}
// Put in symbol Table
/*	struct symTab *p;
	if(sT==NULL){
		p=(struct symTab*)calloc(1,sizeof(struct symTab));
		sT=p;
	}
*/	if(f==-1){
//		p=sT+i;
//		p=(struct symTab*)calloc(1,sizeof(struct symTab));
		sT[neST].name=nm, sT[neST].val=v;
		f=neST++;
	}
	return f;
}
int lexeme(){
	int i,t,nB=0;
	char B[NB], *str;
	char c=gnc();
	if(c=='(' || c==')' || c=='{' || c=='}' || c==',' || c==';' || c=='+' || c=='-' || c=='*' || c=='/' || c=='='){
		t=(int)c, B[nB++]=c;
	}
	else if(c==':'){
		B[nB++]=c;
		if((c=gnc())=='=')
			t=(int)':', B[nB++]=c;
	}
// Numbers
	else if(isdigit(c)){
		B[nB++]=c;
		while(isdigit(c=gnc()))
			B[nB++]=c;
		t=IC;
		if(isNtBlank(c))
			po-=1;
		if((c=gnc())=='.'){
			B[nB++]=c;
			while(isdigit(c=gnc()))
				B[nB++]=c;
			t=FC;
		}
		if(isNtBlank(c))
			po-=1;
	}
// Identifier
	else if(isalpha(c) || c=='_'){
		B[nB++]=c;
		while(isalnum(c=gnc()) || c=='_')
			B[nB++]=c;
		t=ID;
		if(isNtBlank(c))
			po-=1;
	}
	else	{ t=(int)c; goto R; }

	str=(char*)malloc(nB+1);
	for(int i=0; i<nB; i++)
		str[i]=B[i];
	str[nB]='\0';
//	printf("%s %d\t",str,(int)strlen(str));

	for(i=0;i<14;i++){
		if(strcmp(str,kw[i])==0){
			t=K+i;
			break;
		}
	}
	if(isNtBlank(t))
		t=tM+putInSymTab(str,t);
//	printf("<%d,\"%s\">\n",t,str);
R:	return t;
}
