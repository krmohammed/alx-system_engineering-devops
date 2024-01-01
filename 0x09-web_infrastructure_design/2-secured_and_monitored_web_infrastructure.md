# Simple Web Stack

![simple web stack](https://i.imgur.com/5kAJsjn.png)

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
- Firewalls added for traffic control and security at different levels.
- HTTPS implemented for encrypted communication, securing data during transmission.
- Monitoring clients provide real-time insights into server health and performance. This helps to identify and resolve issues promptly.

### Other Specifics
- **Firewalls** are essential security components that act as barriers between a trusted internal network and untrusted external networks, such as the internet.
- Why is the traffic served over HTTPS?
    - HTTPS encrypts data exchanged between the user's browser and the web server. Encryption prevents eavesdropping, ensuring that sensitive information, such as login credentials and personal data, remains confidential.
    - It guards against data tampering and modifications by malicious actors.
    - Search engines prioritize HTTPS-enabled websites, leading to improved search rankings.
- Monitoring tool is used for the following:
    - Issue detection - helps detect anomalies, errors, or deviations from expected behavior in real-time.
    - Provides insights into system performance, allowing for optimization of resources and infrastructure.
- How Monitoring Tool Collects Data
    - Agents are installed on servers or devices to collect and transmit data. Agents gather information about system performance, resource utilization, and application-specific metrics.

## Issues with this Infrastructure
1. SSL Termination at Load Balancer:
Termination without encrypting communication to the web server poses a security risk.
2. Single MySQL Server for Writes:
A single point of failure for write operations in the MySQL database.
3. Identical Components Across Servers:
Similar components across servers may lead to simultaneous failures, reducing fault isolation.
