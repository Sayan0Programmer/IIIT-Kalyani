/*
 * message passing Client side
 */
#include<arpa/inet.h>
#include<stdio.h>
#include<string.h>
#include<sys/socket.h>
#include<unistd.h>

int main() {
	const char* server_name = "localhost";
	const int server_port = 8877;

	struct sockaddr_in server_address;
	memset(&server_address, 0, sizeof(server_address));
	server_address.sin_family = AF_INET;

	// converts binary representation of server name & stores it as sin_addr
	inet_pton(AF_INET, server_name, &server_address.sin_addr);

	// htons: port in network order format
	server_address.sin_port = htons(server_port);

	// open a stream socket
	int sock;
	if((sock = socket(PF_INET, SOCK_STREAM, 0))<0){
		perror("Can't create socket\n");
		return 1;
	}

	// TCP is connection oriented, a reliable connection
	// **must** be established before any data is exchanged
	if (connect(sock, (struct sockaddr*)&server_address, sizeof(server_address))<0){
		perror("could not connect to server\n");
		return 1;
	}

	//  s_msg that will be sent to the server
	const char s_msg[100],c=0;
	int i;
	printf("Enter the message: ");
	while(c!='\n'){
		c=getchar();
		if(c!='\n')
			s_msg[i++]=c;
	}
	send(sock, s_msg, strlen( s_msg), 0);
	
	// receive

	int n = 0;
	int len = 0, maxlen = 100;
	char r_msg[maxlen];
	char* pbuffer = r_msg;

	// will remain open until the server terminates the connection
	while ((n = recv(sock, pbuffer, maxlen, 0)) > 0) {
		pbuffer += n;
		maxlen -= n;
		len += n;

		buffer[len] = '\0';
		printf("received: '%s'\n", r_msg);
	}

	// close the socket
	close(sock);
	return 0;
}
