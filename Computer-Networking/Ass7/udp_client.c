/*
 * message passing Client side
 */
#include<arpa/inet.h>
#include<stdio.h>
#include<string.h>
#include<sys/socket.h>
#include<unistd.h>

int main(){
	const char* server_name = "localhost";
	const int server_port = 8877;

	struct sockaddr_in server_address;
	memset(&server_address, 0, sizeof(server_address));
	server_address.sin_family = AF_INET;

	// converts binary representation of server name & stores it as sin_addr
	inet_pton(AF_INET, server_name, &server_address.sin_addr);

	// htons: port in network order format
	server_address.sin_port = htons(server_port);

	// open socket
	int sock;
	if((sock = socket(PF_INET, SOCK_DGRAM, 0))<0){
		perror("Can't Create Socket\n");
		return 1;
	}

	const char* s_msg = "Hello, World!\n";	// send_message

	// send data
	int len = sendto(sock, s_msg, strlen(s_msg), 0, (struct sockaddr*)&server_address, sizeof(server_address));

	char r_msg[100];	// receive echoed data back
	recvfrom(sock, r_msg, len, 0, NULL, NULL);

	r_msg[len] = '\0';
	printf("recieved: '%s'\n", r_msg);

	// close the socket
	close(sock);
	return 0;
}
