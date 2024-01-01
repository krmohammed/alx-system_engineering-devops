# Simple Web Stack

![simple web stack](https://i.imgur.com/YmTt0cw.png)

1. User accessing the website enters the url `www.foobar.com` in the address bar of the web browser
2. The user's computer sends a DNS (Domain Name System) query to resolve `www.foobar.com` to an IP address.
3. The DNS system returns the IP address `8.8.8.8`, associated with the domain
4. The user's browser establishes a connection to the load balancer (HAproxy).
5. The load balancer, using a **round robin** algorithm, directs the user's request to one of the servers.
- A round robin algorithm passes each new connection request to the next server in line, eventually distributing connections evenly across the array of machines being load balanced
6. The web server (Nginx) of the selected server receives the HTTP request for `www.foobar.com.`
7. Nginx processes the request, handling static content directly and forwarding dynamic content requests to the application server.
8. The application server, running the website's codebase, receives the dynamic content request from the web server.
9. It processes the request, executes the necessary business logic, and communicates with the MySQL database if needed.
10. The application server interacts with the MySQL database to retrieve or update data based on the user's request.
11. The application server generates the dynamic content (e.g., HTML pages) based on the processed data and business logic.
12. The web server receives the response from the application server and sends it back to the user's browser through the load balancer.
13. The user's browser renders the received content, displaying the website `www.foobar.com` with all its dynamic and static elements.

---

## Specifics of this infrastructure
### Why Additional Elements?
- The additional servers provide redundancy and fault tolerance. If one server fails, the other can handle incoming traffic, ensuring high availability.
- The load balancer distributes incoming traffic across multiple severs. This prevents overload on a single server and improving overall performance.

### Other Specifics
- Both application servers (Server 1 and Server 2) are actively (active-active setup) handling requests simultaneously.
    - In an Active-Active setup, all servers are actively handling requests simultaneously. But in an Active-Passive setup, only one server handles requests actively (Primary), while the others are in standby mode (Passive).
    - Active-Active setups are more scalable as additional servers can be added to the pool to handle increased load.
    - Active-Passive setups are less scalable as only the active server handles the load.
- A Primary-Replica (or Master-Slave) database cluster is a configuration where there is one primary (master) database server and one or more replica (slave) database servers.
    - The primary server is the authoritative source for read and write operations. It handles write transactions and updates the database.
    - Replica servers replicate data from the primary server. They handle read-only queries and can be used for backup purposes, reporting, or distributing read operations to improve performance.


## Issues with this Infrastructure
1. Single Point(s) of Failure (SPOF)
    - There is a single point of failure with regards to the load balancer. Being a single instance,  incoming traffic might not be distributed if it fails.
2. Security Issues
    -  This infrastructure lacks a firewall. This can expose servers to unauthorized access and various security threats.
    - It also lacks HTTPS(SSL/TLS) encryption for communication between the user and the web server. Lack of HTTPS exposes data transmitted over the network to potential eavesdropping and man-in-the-middle attacks.
3. Monitoring Issues
    - Lack of monitoring can lead to delays in identifying and resolving issues promptly, affecting the overall reliability and performance of the system.
