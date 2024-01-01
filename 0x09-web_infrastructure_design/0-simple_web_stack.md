# Simple Web Stack

![simple web stack](https://i.imgur.com/DgZaGRT.png)

1. User accessing the website enters the url `www.foobar.com` in the address bar of the web browser
2. The user's computer sends a DNS (Domain Name System) query to resolve `www.foobar.com` to an IP address.
3. The DNS system returns the IP address `8.8.8.8`, associated with the domain
4. The user's browser establishes a connection to the server at IP address `8.8.8.8` on `port 80` (default for HTTP).
5. The web server (Nginx) receives the HTTP request for `www.foobar.com.`
6. Nginx processes the request, handling static content directly and forwarding dynamic content requests to the application server.
7. The application server, running the website's codebase, receives the dynamic content request from the web server.
8. It processes the request, executes the necessary business logic, and communicates with the MySQL database if needed.
9. The application server interacts with the MySQL database to retrieve or update data based on the user's request.
10. The application server generates the dynamic content (e.g., HTML pages) based on the processed data and business logic.
11. The web server receives the response from the application server and sends it back to the user's browser.
12. The user's browser renders the received content, displaying the website `www.foobar.com` with all its dynamic and static elements.

---

## Specifics fo this infrastructure
### Server
A **server** is a computer or system that provides services or resources to other computers, known as clients, over a network.

### Role of the domain name
The **domain name** `www.foobar.com` provides a human-readable address for the server's IP `8.8.8.8`. It's used to access the website instead of using the IP directly.

### Type of DNS Record `www`
The **DNS record** for `www` in `www.foobar.com` is a **CNAME** *(Canonical Name)* record, pointing to the server's IP. the canonical name being `foobar.com`, in an A record, pointing to `8.8.8.8`.

### Role of the Web server
The **web server** *(Nginx)* handles incoming HTTP requests, serves static content, and forwards dynamic content requests to the application server.

### Role of the Application server
The **application server** runs the website's codebase, generating dynamic content and communicating with the database. It processes requests from the web server.

### Role of the database
The **database** *(MySQL)* stores and manages the website's data. It is accessed by the application server to perform read and write operations.

### Communication user's computer
The server communicates with the user's computer over the internet using the **HTTP protocol**.

---

## Issues with this Infrastructure
- Single Point of Failure (SPOF)
The entire infrastructure is hosted on a single server `(8.8.8.8)`, making it vulnerable to a single point of failure. If the server goes down, the entire website becomes inaccessible.
- Downtime During Maintenance
When performing maintenance tasks like deploying new code, the web server needs to be restarted, causing downtime during the restart process.
- Scalability Concerns
This infrastructure may struggle to handle increased traffic efficiently. Scaling is challenging since a single server has limitations in terms of processing power, memory, and network bandwidth. Considerations for load balancing and horizontal scaling would be needed for better scalability.
